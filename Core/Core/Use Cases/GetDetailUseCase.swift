import Foundation
import Combine

// sourcery: AutoMockable
public protocol GetDetailUseCase {
    func callAsFunction(id: String, type: Marvel.Source) -> AnyPublisher<Marvel.MarvelEntity?, Error>
}

public class GetDetail: GetDetailUseCase {
    @Inject private var apiClient: DetailAPIClient

    public init() {}

    public func callAsFunction(id: String, type: Marvel.Source) -> AnyPublisher<Marvel.MarvelEntity?, Error> {
        switch type {
        case .characters:
            return apiClient.getCharacter(id: id)
        case .comics:
            return apiClient.getComic(id: id)
        case .creators:
            return apiClient.getCreator(id: id)
        case .events:
            return apiClient.getEvent(id: id)
        case .series:
            return apiClient.getSerie(id: id)
        case .stories:
            return apiClient.getStory(id: id)
        }
    }
}
