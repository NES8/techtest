import Foundation

extension MarvelApiDTO.StoriesElement {

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
        let comics, series, events: Comics
        let characters: MarvelApiDTO.CharactersElement
        let creators: MarvelApiDTO.CreatorsElement
        let originalissue: Originalissue

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, type, modified, thumbnail, comics, series, events, characters, creators, originalissue
        }
    }

    // MARK: - Comics
    struct Comics: Codable {
        let available, returned, collectionURI: String
        let items: [Originalissue]
    }

    // MARK: - Originalissue
    struct Originalissue: Codable {
        let resourceURI, name: String
    }
}
