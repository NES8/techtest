import Foundation
import Combine

// sourcery: AutoMockable
public protocol APIClient {
    func getCharacters(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getComics(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getCreators(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getEvents(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getSeries(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getStories(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}

public protocol MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity { get }
}
