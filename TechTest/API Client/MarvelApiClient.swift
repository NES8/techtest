import Foundation
import Combine
import Alamofire
import CryptoKit

class MarvelAPIClient: APIClient {

    struct Constants {
        static let limit = 33
    }

    private let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    // MARK: - Characters

    func getCharacters() -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        getCharacters(nameStartsWith: nil)
    }

    func getCharacters(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        var authParams: [String: Any] = [
            "limit": Constants.limit
        ]
        if let starts = nameStartsWith {
            authParams["nameStartsWith"] = starts
        }
        let path = "/v1/public/characters"
        let url = baseUrl + path
        
        return performRequest(at: url, parameters: authParams, decodeWith: MarvelApiDTO.Character.Dto.self)
            .map(\.data)
            .map(\.results)
            .map{ $0.map(\.domainEntity) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }

    // MARK: - Perform request

    private func performRequest<T: Decodable>(at url: String, parameters: [String: Any], decodeWith type: T.Type) -> AnyPublisher<T, AFError> {
        let authenticatedParameters = authenticateParameters(parameters: parameters)

        return AF.request(url, parameters: authenticatedParameters)
          .validate()
          .publishDecodable(type: T.self)
          .value()
    }

    private func authenticateParameters(parameters: [String: Any]) -> [String: Any] {
        // https://developer.marvel.com/documentation/authorization

        let now = Date().timeIntervalSinceReferenceDate
        let nowAsString = "\(now)"
        let privateKey = "f28893975515b1a125c3ba402f5c0f3437fc02fe"
        let publicKey = "27d7f6b42b039c072540ea5daa1b99fa"
        let hashContent = (nowAsString + privateKey + publicKey).data(using: .utf8)!
        let digest = Insecure.MD5.hash(data: hashContent)
        let digestAsString = digest.map { String(format: "%02hhx", $0) }.joined()

        return parameters.merging([
            "apikey": publicKey,
            "ts" : nowAsString,
            "hash": digestAsString
        ]) { (ownKey, _) -> Any in
            return  ownKey
        }
    }
}
