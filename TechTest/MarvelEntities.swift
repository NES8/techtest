import Foundation

enum Marvel {
    enum Source {
        case character
        case comics
        case creators
        case events
        case series
        case stories
    }

    struct MarvelEntity: Equatable {
        let id: Int
        let name: String
        let description: String
        let source: Source
        let thumbnailURL: URL?
        let wikiURL: URL?
        let detailURL: URL?
    }
}
