import Foundation

public enum Marvel {
    public  enum Source {
        case character
        case comics
        case creators
        case events
        case series
        case stories
    }

    public struct MarvelEntity: Equatable {
        let id: Int
        let name: String
        let description: String
        let source: Source
        let thumbnailURL: URL?
        let wikiURL: URL?
        let detailURL: URL?

        public init(
            id: Int,
            name: String,
            description: String,
            source: Source,
            thumbnailURL: URL?,
            wikiURL: URL?,
            detailURL: URL?
        ) {
            self.id = id
            self.name = name
            self.description = description
            self.source = source
            self.thumbnailURL = thumbnailURL
            self.wikiURL = wikiURL
            self.detailURL = detailURL
        }
    }
}
