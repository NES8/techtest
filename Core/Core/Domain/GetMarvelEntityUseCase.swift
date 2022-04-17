import Foundation
import Combine

// sourcery: AutoMockable
public protocol GetMarvelEntityUseCase {
    func callAsFunction(type: Marvel.Source, filter: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}

public class GetMarvelEntity: GetMarvelEntityUseCase {
    @Inject private var apiClient: APIClient

    public init() {}

    public func callAsFunction(type: Marvel.Source, filter: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        switch type {
        case .character:
            return apiClient.getCharacters(nameStartsWith: filter)
        case .comics:
            return apiClient.getComics(nameStartsWith: filter)
        case .creators:
            return apiClient.getCreators(nameStartsWith: filter)
        case .events:
            return apiClient.getEvents(nameStartsWith: filter)
        case .series:
            return apiClient.getSeries(nameStartsWith: filter)
        case .stories:
            return apiClient.getStories(nameStartsWith: filter)
        }
    }
}
