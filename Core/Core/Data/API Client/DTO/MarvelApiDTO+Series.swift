import Foundation

extension MarvelApiDTO.Series {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let title: String
        let resultDescription, resourceURI: String?
        let urls: [MarvelApiDTO.URLElement]?
        let startYear, endYear: Int?
        let rating, modified: String?
        let thumbnail: MarvelApiDTO.Thumbnail?
        let comics, stories, events, characters, creators: MarvelApiDTO.Element?
        let next, previous: MarvelApiDTO.Item?

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, urls, startYear, endYear, rating, modified, thumbnail, comics, stories, events, characters, creators, next, previous
        }
    }
}

extension MarvelApiDTO.Series.Result: MarvelAPIDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let thumbnailUrl: URL? = {
            guard let path = thumbnail?.path, let ext = thumbnail?.thumbnailExtension else { return nil }
            return URL(string: path + "." + ext)
        }()

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: resultDescription,
            source: .series,
            thumbnailURL: thumbnailUrl
        )
    }
}
