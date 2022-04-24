import Foundation

public enum Marvel {
    public enum Source {
        case characters
        case comics
        case creators
        case events
        case series
        case stories
    }

    public struct MarvelEntity {
        public let id: Int
        public let name: String
        public let description: String?
        public let source: Source
        public let thumbnailURL: URL?

        public init(
            id: Int,
            name: String,
            description: String?,
            source: Source,
            thumbnailURL: URL?
        ) {
            self.id = id
            self.name = name
            self.description = description
            self.source = source
            self.thumbnailURL = thumbnailURL
        }
    }
}
