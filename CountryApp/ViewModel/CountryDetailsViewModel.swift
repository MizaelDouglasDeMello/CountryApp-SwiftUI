import Foundation
import Combine

class CountryDetailsViewModel: ObservableObject {
    @Published var country: Country

    init(country: Country) {
        self.country = country
    }

    // Exemplo de função para formatar a população (você pode adicionar mais conforme necessário)
    func formattedPopulation() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: country.population)) ?? "N/A"
    }
}
