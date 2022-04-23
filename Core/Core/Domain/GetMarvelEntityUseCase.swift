import Foundation
import Combine

// sourcery: AutoMockable
public protocol GetMarvelEntityUseCase {
    func callAsFunction(_ searchQuery: SearchQuery) -> AnyPublisher<[Marvel.MarvelEntity], Error>
}

public class GetMarvelEntity: GetMarvelEntityUseCase {
    @Inject private var apiClient: APIClient

    public init() {}

    public func callAsFunction(_ searchQuery: SearchQuery) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        let pageSize = searchQuery.pageSize.rawValue
        let filter = searchQuery.filter

        switch searchQuery.type {
        case .characters:
            return apiClient.getCharacters(nameStartsWith: filter, pageSize: pageSize)
        case .comics:
            return apiClient.getComics(nameStartsWith: filter, pageSize: pageSize)
        case .creators:
            return apiClient.getCreators(nameStartsWith: filter, pageSize: pageSize)
        case .events:
            return apiClient.getEvents(nameStartsWith: filter, pageSize: pageSize)
        case .series:
            return apiClient.getSeries(nameStartsWith: filter, pageSize: pageSize)
        case .stories:
            return apiClient.getStories(nameStartsWith: filter, pageSize: pageSize)
        }
    }
}
