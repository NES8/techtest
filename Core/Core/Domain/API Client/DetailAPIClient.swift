import Foundation
import Combine

// sourcery: AutoMockable
public protocol DetailAPIClient {
    func getCharacter(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error>
    func getComic(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error>
    func getCreator(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error>
    func getEvent(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error>
    func getSerie(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error>
    func getStory(id: String) -> AnyPublisher<Marvel.MarvelEntity?, Error>
}
