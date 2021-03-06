import Foundation
import Combine
import Alamofire
import CryptoKit

class MarvelAPIClient {

    private let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    // MARK: - Constants

    enum Endpoint: String {
        case characters
        case comics
        case creators
        case events
        case series
        case stories

        var path: String {
            "/v1/public/" + self.rawValue
        }

        var startsWithKeyParameter: String {
            switch self {
            case .characters,
                    .creators,
                    .events:
                return "nameStartsWith"
            case .comics,
                    .series:
                return "titleStartsWith"
            case .stories:
                preconditionFailure("Stories can't use name or title filter")
            }
        }
    }

    // MARK: Get

    private func getMarvelEntities<T: Decodable & MarvelAPIDomainEntity>(
        endpoint: Endpoint,
        responseType: T.Type,
        filterStartsWith: String?,
        pageSize limit: Int
    ) -> AnyPublisher<[Marvel.MarvelEntity], Error> {

        var authParams: [String: Any] = [
            "limit": limit
        ]
        if let filter = filterStartsWith, !filter.isEmpty {
            authParams[endpoint.startsWithKeyParameter] = filter
        }

        let url = baseUrl + endpoint.path

        return performRequest(at: url, parameters: authParams, decodeWith: MarvelApiDTO.Dto<T>.self)
            .map(\.data)
            .map(\.results)
            .map{ $0.map(\.domainEntity) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }

    private func getMarvelEntity<T: Decodable & MarvelAPIDomainEntity>(
        endpoint: Endpoint,
        responseType: T.Type,
        id: String
    ) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        let url = baseUrl + endpoint.path + "/" + id

        return performRequest(at: url, parameters: [:], decodeWith: MarvelApiDTO.Dto<T>.self)
            .map(\.data)
            .map(\.results)
            .map{ $0.map(\.domainEntity).first }
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

extension MarvelAPIClient: SearchAPIClient {

    func getCharacters(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        getMarvelEntities(endpoint: .characters, responseType: MarvelApiDTO.Character.Result.self, filterStartsWith: nameStartsWith, pageSize: pageSize)
    }

    func getComics(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        getMarvelEntities(endpoint: .comics, responseType: MarvelApiDTO.Comics.Result.self, filterStartsWith: nameStartsWith, pageSize: pageSize)
    }

    func getCreators(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        getMarvelEntities(endpoint: .creators, responseType: MarvelApiDTO.Creators.Result.self, filterStartsWith: nameStartsWith, pageSize: pageSize)
    }

    func getEvents(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        getMarvelEntities(endpoint: .events, responseType: MarvelApiDTO.Events.Result.self, filterStartsWith: nameStartsWith, pageSize: pageSize)
    }

    func getSeries(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        getMarvelEntities(endpoint: .series, responseType: MarvelApiDTO.Series.Result.self, filterStartsWith: nameStartsWith, pageSize: pageSize)
    }

    func getStories(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        getMarvelEntities(endpoint: .stories, responseType: MarvelApiDTO.Stories.Result.self, filterStartsWith: nameStartsWith, pageSize: pageSize)
    }
}

extension MarvelAPIClient: DetailAPIClient {
    func getCharacter(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        getMarvelEntity(endpoint: .characters, responseType: MarvelApiDTO.Character.Result.self, id: id)
    }

    func getComic(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        getMarvelEntity(endpoint: .comics, responseType: MarvelApiDTO.Comics.Result.self, id: id)
    }

    func getCreator(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        getMarvelEntity(endpoint: .creators, responseType: MarvelApiDTO.Creators.Result.self, id: id)
    }

    func getEvent(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        getMarvelEntity(endpoint: .events, responseType: MarvelApiDTO.Events.Result.self, id: id)
    }

    func getSerie(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        getMarvelEntity(endpoint: .series, responseType: MarvelApiDTO.Series.Result.self, id: id)
    }

    func getStory(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        getMarvelEntity(endpoint: .stories, responseType: MarvelApiDTO.Stories.Result.self, id: id)
    }
}
