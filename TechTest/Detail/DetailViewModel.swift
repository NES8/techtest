import Foundation
import Core

struct DetailViewModel {
    let name: String

    init(entity: Marvel.MarvelEntity) {
        self.name = entity.name
    }
}
