import Foundation
import Combine

protocol APIClient {
    func getCharacters() -> AnyPublisher<[Marvel.Character], Error>
    func getCharacters(nameStartsWith: String?) -> AnyPublisher<[Marvel.Character], Error>
}
