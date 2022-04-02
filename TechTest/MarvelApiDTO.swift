import Foundation

enum MarvelApiDTO {
    enum Character {}
    enum Comics {}
    enum Creators {}
    enum Events {}
    enum Series {}
    enum Stories {}
}

extension MarvelApiDTO {

    // MARK: - Characters
    struct CharactersElement: Decodable {
        let available, returned: Int
        let collectionURI: String
        let items: [CharactersItem]
    }

    // MARK: - CharactersItem
    struct CharactersItem: Decodable {
        let resourceURI, name, role: String
    }

    // MARK: - Creators
    struct CreatorsElement: Decodable {
        let available, returned: Int
        let collectionURI: String
        let items: [CreatorsItem]
    }

    // MARK: - CharactersItem
    struct CreatorsItem: Decodable {
        let resourceURI, name, role: String
    }

    // MARK: - Stories
    struct StoriesElement: Decodable {
        let available, returned: Int
        let collectionURI: String
        let items: [StoriesItem]
    }

    // MARK: - StoriesItem
    struct StoriesItem: Decodable {
        let resourceURI, name, type: String
    }

    // MARK: - Events
    struct EventsElement: Decodable {
        let available, returned: Int
        let collectionURI: String
        let items: [SeriesItem]
    }

    // MARK: - EventsItem
    struct EventsItem: Decodable {
        let resourceURI, name: String
    }

    // MARK: - Series
    struct SeriesElement: Decodable {
        let available, returned: Int
        let collectionURI: String
        let items: [SeriesItem]
    }

    // MARK: - SeriesItem
    struct SeriesItem: Decodable {
        let resourceURI, name: String
    }

    // MARK: - Comics
    struct ComicsElement: Decodable {
        let available, returned: Int
        let collectionURI: String
        let items: [ComicsItem]
    }

    // MARK: - ComicsItem
    struct ComicsItem: Decodable {
        let resourceURI, name: String
    }

    // MARK: - Next
    struct Next: Codable {
        let resourceURI, name: String
    }

    // MARK: - Thumbnail
    struct Thumbnail: Decodable {
        let path, thumbnailExtension: String

        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
    }

    // MARK: - URLElement
    struct URLElement: Decodable {
        var type: LinkType
        var url: URL

        enum LinkType: String, Decodable {
            case detail
            case wiki
            case comiclink
        }
    }
}
