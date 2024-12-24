import Foundation

struct Country: Codable, Identifiable {
    let id = UUID() // Identifiable para uso em List
    let name: CountryName
    let capital: [String]?
    let region: String
    let subregion: String?
    let population: Int
    let flags: CountryFlags
    let coatOfArms: CountryCoatOfArms?
    let area: Double?

    enum CodingKeys: String, CodingKey {
        case name, capital, region, subregion, population, flags, coatOfArms, area
    }
}

struct CountryName: Codable {
    let common: String
    let official: String
}

struct CountryFlags: Codable {
    let png: String
    let svg: String
}

struct CountryCoatOfArms: Codable {
    let png: String?
    let svg: String?
}
