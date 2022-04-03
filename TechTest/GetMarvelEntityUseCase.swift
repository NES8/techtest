import Foundation
import Combine

// sourcery: AutoMockable
protocol GetMarvelEntityUseCase {
    func callAsFunction(type: Marvel.Source) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}

class GetMarvelEntity: GetMarvelEntityUseCase {
    let apiClient = MarvelAPIClient(baseUrl: "https://gateway.marvel.com")

    func callAsFunction(type: Marvel.Source) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        apiClient
            .getCharacters()
    }
}
