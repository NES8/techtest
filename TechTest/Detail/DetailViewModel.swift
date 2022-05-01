import Foundation
import Core

struct DetailViewModel {
    
    let imageUrl: URL?
    let name: String
    let description: String?

    init(entity: Marvel.MarvelEntity) {
        self.imageUrl = entity.thumbnailURL
        self.name = entity.name
        self.description = entity.description
    }
}
