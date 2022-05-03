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

    // MARK: - Dto
    struct Dto<T: Decodable>: Decodable {
        let code: Int
        let status, copyright, attributionText, attributionHTML: String?
        let data: DataClass<T>
        let etag: String?
    }

    // MARK: - DataClass
    struct DataClass<T: Decodable>: Decodable {
        let offset, limit, total, count: Int?
        let results: [T]
    }

    // MARK: - Element
    struct Element: Decodable {
        let available, returned: Int?
        let collectionURI: String?
        let items: [Item]
    }

    // MARK: - Item
    struct Item: Decodable {
        let resourceURI, name: String?
        let role, type: String?
    }

    // MARK: - Thumbnail
    struct Thumbnail: Decodable {
        let path, thumbnailExtension: String?

        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
    }

    // MARK: - URLElement
    struct URLElement: Decodable {
        var type: String?
        var url: URL?
    }
}
