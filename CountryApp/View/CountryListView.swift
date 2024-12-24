import SwiftUI
import Kingfisher

struct CountryListView: View {
    @StateObject private var viewModel = CountryListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.countries) { country in
                    NavigationLink(destination: CountryDetailsView(country: country)) {
                        CountryRow(country: country)
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Country App")
        }
    }
}
