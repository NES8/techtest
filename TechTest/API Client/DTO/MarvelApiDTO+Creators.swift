import Foundation

extension MarvelApiDTO.Creators {

    // MARK: - Dto
    struct Dto: Decodable {
        let code: Int
        let status, copyright, attributionText, attributionHTML: String
        let data: DataClass
        let etag: String
    }

    // MARK: - DataClass
    struct DataClass: Decodable {
        let offset, limit, total, count: Int
        let results: [Result]
    }

    // MARK: - Result
    struct Result: Decodable {
        let id, firstName, middleName, lastName: String
        let suffix, fullName, resourceURI: String
        let urls: [MarvelApiDTO.URLElement]
        let thumbnail: MarvelApiDTO.Thumbnail
        let series, stories, comics, events: MarvelApiDTO.Element
    }
}
