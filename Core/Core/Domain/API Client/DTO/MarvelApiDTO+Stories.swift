import Foundation

extension MarvelApiDTO.Stories {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let title: String
        let resultDescription, resourceURI: String?
        let type, modified: String?
        let thumbnail: MarvelApiDTO.Thumbnail?
        let comics, series, events, characters, creators: MarvelApiDTO.Element?
        let originalissue: MarvelApiDTO.Item?

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, type, modified, thumbnail, comics, series, events, characters, creators, originalissue
        }
    }
}

extension MarvelApiDTO.Stories.Result: MarvelAPIDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let thumbnailUrl: URL? = {
            guard let path = thumbnail?.path, let ext = thumbnail?.thumbnailExtension else { return nil }
            return URL(string: path + "." + ext)
        }()

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: resultDescription,
            source: .stories,
            thumbnailURL: thumbnailUrl
        )
    }
}
