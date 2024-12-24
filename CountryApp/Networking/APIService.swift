import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class APIService {
    static let shared = APIService()
    private let baseURL = "https://restcountries.com/v3.1"

    private init() {}

    func fetchAllCountries() async throws -> [Country] {
        guard let url = URL(string: "\(baseURL)/all") else {
            throw NetworkError.badURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let countries = try JSONDecoder().decode([Country].self, from: data)
            return countries
        } catch {
            throw NetworkError.decodingError
        }
    }

    func fetchCountriesByName(name: String) async throws -> [Country] {
        guard let url = URL(string: "\(baseURL)/name/\(name)") else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let countries = try JSONDecoder().decode([Country].self, from: data)
            return countries
        } catch {
            throw NetworkError.decodingError
        }
    }
}
