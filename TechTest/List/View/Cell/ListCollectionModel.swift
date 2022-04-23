import Foundation
import Core

struct ListCollectionModel: Hashable {
    let id: String
    let title: String
    let description: String?
    let pictureURL: URL?
    let category: ListSection.Category?

    init(entity: Marvel.MarvelEntity) {
        self.id = String(entity.id)
        self.title = entity.name
        self.description = entity.description
        self.pictureURL = entity.thumbnailURL
        self.category = .init(source: entity.source)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: ListCollectionModel, rhs: ListCollectionModel) -> Bool {
        lhs.id == rhs.id
    }
}
