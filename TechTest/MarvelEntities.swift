import Foundation

enum Marvel {
    struct Character: Equatable {
        public var id: Int
        public var name: String
        public var description: String
        public var thumbnailURL: URL?
        public var wikiURL: URL?
        public var detailURL: URL?
    }
}
