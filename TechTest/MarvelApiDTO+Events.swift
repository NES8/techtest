import Foundation

extension MarvelApiDTO.Events {

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
        let modified, start, end: String
        let thumbnail: MarvelApiDTO.Thumbnail
        let comics: MarvelApiDTO.ComicsElement
        let stories: MarvelApiDTO.StoriesElement
        let series: MarvelApiDTO.SeriesElement
        let characters: MarvelApiDTO.CharactersElement
        let creators: MarvelApiDTO.CreatorsElement
        let next, previous: MarvelApiDTO.Next

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, urls, modified, start, end, thumbnail, comics, stories, series, characters, creators, next, previous
        }
    }
}
