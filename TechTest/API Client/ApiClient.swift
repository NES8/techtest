import Foundation
import Combine

// sourcery: AutoMockable
protocol APIClient {
    func getCharacters() -> AnyPublisher<[Marvel.MarvelEntity], Error>
    func getCharacters(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}
