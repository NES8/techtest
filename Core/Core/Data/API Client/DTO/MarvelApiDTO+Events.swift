import Foundation

extension MarvelApiDTO.Events {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let title: String
        let resultDescription, resourceURI: String?
        let urls: [MarvelApiDTO.URLElement]?
        let modified, start, end: String?
        let thumbnail: MarvelApiDTO.Thumbnail?
        let comics, stories, series, characters, creators: MarvelApiDTO.Element?
        let next, previous: MarvelApiDTO.Item?

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, urls, modified, start, end, thumbnail, comics, stories, series, characters, creators, next, previous
        }
    }
}

extension MarvelApiDTO.Events.Result: MarvelAPIDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let thumbnailUrl: URL? = {
            guard let path = thumbnail?.path, let ext = thumbnail?.thumbnailExtension else { return nil }
            return URL(string: path + "." + ext)
        }()

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: resultDescription,
            source: .events,
            thumbnailURL: thumbnailUrl
        )
    }
}
