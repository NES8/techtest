import Foundation
import Combine

// sourcery: AutoMockable
public protocol SearchAPIClient {
    func getCharacters(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getComics(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getCreators(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getEvents(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getSeries(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getStories(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}
