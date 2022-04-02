import Foundation

// Using enum to group

enum MarvelApiDTO {
    enum Character {}
    enum Comics {}
    enum Creators {}
    enum Events {}
    enum Series {}
    enum Stories {}
}

// All DTO structs generated with help of https://app.quicktype.io/#l=swift
// parsing JSON from https://developer.marvel.com/docs#!/public/getStoryCollection_get_32

extension MarvelApiDTO {

    // MARK: - Element
    struct Element: Decodable {
        let available, returned: Int
        let collectionURI: String
        let items: [Item]
    }

    // MARK: - Item
    struct Item: Decodable {
        let resourceURI, name: String
        let role, type: String?
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
