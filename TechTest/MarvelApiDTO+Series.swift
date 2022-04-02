import Foundation

extension MarvelApiDTO.SeriesElement {

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
        let urls: [MarvelApiDTO.URLElement]
        let startYear, endYear, rating, modified: String
        let thumbnail: MarvelApiDTO.Thumbnail
        let comics: MarvelApiDTO.ComicsElement
        let stories: MarvelApiDTO.StoriesElement
        let events: MarvelApiDTO.ComicsElement
        let characters: MarvelApiDTO.CharactersElement
        let creators: MarvelApiDTO.CreatorsElement
        let next, previous: MarvelApiDTO.Next

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, urls, startYear, endYear, rating, modified, thumbnail, comics, stories, events, characters, creators, next, previous
        }
    }
}
