import SwiftUI
import Kingfisher

struct CountryDetailsView: View {
    let country: Country

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Bandeira
                HStack {
                    Spacer() // Empurra a imagem para o centro
                    KFImage(URL(string: country.flags.png))
                        .placeholder {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150) // Placeholder menor
                                .foregroundColor(.gray)
                        }
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150) // Largura fixa para a imagem
                    Spacer()
                }
                
                Text("Coat of Arms")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 5)
                
                // Brasão
                if let coatOfArmsURL = URL(string: country.coatOfArms?.png ?? "") {
                    HStack {
                        Spacer()
                        KFImage(coatOfArmsURL)
                            .placeholder {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 350, height: 150) // Placeholder menor
                                    .foregroundColor(.gray)
                            }
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350) // Largura fixa para a imagem
                        Spacer()
                    }
                }

                // Restante do conteúdo (igual ao seu código anterior)
                Text(country.name.common)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 5)

                Text("Official Name: \(country.name.official)")
                    .font(.title3)

                Text("Capital: \(country.capital?.joined(separator: ", ") ?? "N/A")")

                Text("Region: \(country.region)")

                if let subregion = country.subregion {
                    Text("Subregion: \(subregion)")
                }

                Text("Population: \(country.population)")

                if let area = country.area {
                    Text("Area: \(area) km²")
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(country.name.common)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    // Criar um país de exemplo
    let exampleCountry = Country(
        name: CountryName(common: "Brazil", official: "Federative Republic of Brazil"),
        capital: ["Brasília"],
        region: "Americas",
        subregion: "South America",
        population: 212000000,
        flags: CountryFlags(png: "https://flagcdn.com/w320/br.png", svg: "https://flagcdn.com/br.svg"),
        coatOfArms: CountryCoatOfArms(png: "https://mainfacts.com/media/images/coats_of_arms/br.png", svg: "https://mainfacts.com/media/images/coats_of_arms/br.svg"),
        area: 8515767.0
    )

    // Retornar a CountryDetailsView com o país de exemplo
    return CountryDetailsView(country: exampleCountry)
}
