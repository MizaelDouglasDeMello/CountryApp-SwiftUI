import Foundation
import Combine
import SwiftUI

class CountryListViewModel: ObservableObject {
    @Published private(set) var countries: [Country] = []
    @Published var searchText: String = ""
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] term in
                Task {
                    if term.isEmpty {
                        await self?.loadCountries()
                    } else {
                        await self?.searchCountries(byName: term)
                    }
                }
            }
            .store(in: &cancellables)
        
        Task {
            await loadCountries()
        }
    }

    @MainActor
    private func loadCountries() async {
        do {
            countries = try await APIService.shared.fetchAllCountries()
        } catch {
            print("Error loading countries: \(error)")
        }
    }

    @MainActor
    private func searchCountries(byName name: String) async {
        do {
            countries = try await APIService.shared.fetchCountriesByName(name: name)
        } catch {
            print("Error searching countries: \(error)")
        }
    }
}
