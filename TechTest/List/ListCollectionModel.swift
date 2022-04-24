import Foundation
import Core

struct ListCollectionModel: Hashable {
    let itemId: ItemId
    let title: String
    let description: String?
    let pictureURL: URL?
    let category: ListSection.Category?

    init(entity: Marvel.MarvelEntity) {
        self.itemId = .init(id: String(entity.id),
                            source: entity.source)
        self.title = entity.name
        self.description = entity.description
        self.pictureURL = entity.thumbnailURL
        self.category = .init(source: entity.source)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(itemId)
    }

    static func == (lhs: ListCollectionModel, rhs: ListCollectionModel) -> Bool {
        lhs.itemId == rhs.itemId
    }
}
