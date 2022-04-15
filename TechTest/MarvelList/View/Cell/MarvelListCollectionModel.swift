import Foundation
import Core

struct MarvelListCollectionModel: Hashable {
    let id: String
    let title: String
    let description: String
    let pictureURL: URL?

    init(entity: Marvel.MarvelEntity) {
        self.id = String(entity.id)
        self.title = entity.name
        self.description = entity.description
        self.pictureURL = entity.thumbnailURL
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: MarvelListCollectionModel, rhs: MarvelListCollectionModel) -> Bool {
        lhs.id == rhs.id
    }
}
