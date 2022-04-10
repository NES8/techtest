import Foundation
import Core

struct MarvelListCollectionModel {
    let title: String
    let description: String
    let pictureURL: URL?

    init(entity: Marvel.MarvelEntity) {
        self.title = entity.name
        self.description = entity.description
        self.pictureURL = entity.thumbnailURL
    }
}
