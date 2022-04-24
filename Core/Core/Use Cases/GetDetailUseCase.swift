import Foundation
import Combine

// sourcery: AutoMockable
public protocol GetDetailUseCase {
    func callAsFunction(itemId: ItemId) -> AnyPublisher<Marvel.MarvelEntity?, Error>
}

public class GetDetail: GetDetailUseCase {
    @Inject private var apiClient: DetailAPIClient

    public init() {}

    public func callAsFunction(itemId: ItemId) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        switch itemId.source {
        case .characters:
            return apiClient.getCharacter(id: itemId.id)
        case .comics:
            return apiClient.getComic(id: itemId.id)
        case .creators:
            return apiClient.getCreator(id: itemId.id)
        case .events:
            return apiClient.getEvent(id: itemId.id)
        case .series:
            return apiClient.getSerie(id: itemId.id)
        case .stories:
            return apiClient.getStory(id: itemId.id)
        }
    }
}
