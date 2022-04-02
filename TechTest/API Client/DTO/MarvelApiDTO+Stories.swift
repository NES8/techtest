import Foundation

extension MarvelApiDTO.Stories {

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
        let id, title, resultDescription, resourceURI: String
        let type, modified: String
        let thumbnail: MarvelApiDTO.Thumbnail
        let comics, series, events, characters, creators: MarvelApiDTO.Element
        let originalissue: MarvelApiDTO.Item

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, type, modified, thumbnail, comics, series, events, characters, creators, originalissue
        }
    }
}
