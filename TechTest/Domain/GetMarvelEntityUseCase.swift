import Foundation
import Combine

// sourcery: AutoMockable
protocol GetMarvelEntityUseCase {
    func callAsFunction(type: Marvel.Source) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}

class GetMarvelEntity: GetMarvelEntityUseCase {
    @Inject private var apiClient: APIClient

    func callAsFunction(type: Marvel.Source) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        apiClient
            .getCharacters()
    }
}
