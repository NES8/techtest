import Foundation
import Combine

// sourcery: AutoMockable
public protocol GetMarvelEntityUseCase {
    func callAsFunction(type: Marvel.Source) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}

public class GetMarvelEntity: GetMarvelEntityUseCase {
    @Inject private var apiClient: APIClient

    public init() {}

    public func callAsFunction(type: Marvel.Source) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        apiClient
            .getCharacters()
    }
}
