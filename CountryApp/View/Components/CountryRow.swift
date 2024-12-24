import SwiftUI
import Kingfisher

struct CountryRow: View {
    let country: Country

    var body: some View {
        HStack {
            KFImage(URL(string: country.flags.png))
                .placeholder {
                    Image(systemName: "photo") // Placeholder system image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 40)
                        .foregroundColor(.gray)
                }
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 40)

            VStack(alignment: .leading) {
                Text(country.name.common)
                    .font(.headline)
                Text(country.capital?.first ?? "N/A")
                    .font(.subheadline)
            }
        }
    }
}
