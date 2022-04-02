import Foundation
import Combine

// sourcery: AutoMockable
protocol GetCharactersUseCase {
    func callAsFunction() -> AnyPublisher<[Marvel.Character], Error>
}

class GetCharacters: GetCharactersUseCase {
    let apiClient = MarvelAPIClient(baseUrl: "https://gateway.marvel.com")

    func callAsFunction() -> AnyPublisher<[Marvel.Character], Error> {
        apiClient
            .getCharacters()
    }
}
