import Foundation
import Combine

// sourcery: AutoMockable
public protocol APIClient {
    func getCharacters() -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getCharacters(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getComics() -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getComics(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getCreators() -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getCreators(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getEvents() -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getEvents(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getSeries() -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getSeries(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getStories() -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getStories(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}

public protocol MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity { get }
}
