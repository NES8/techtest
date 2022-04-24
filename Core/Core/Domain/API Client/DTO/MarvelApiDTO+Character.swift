import Foundation

extension MarvelApiDTO.Character {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let name: String
        let resultDescription: String?
        let resourceURI: String?
        let urls: [MarvelApiDTO.URLElement]?
        let thumbnail: MarvelApiDTO.Thumbnail?
        let comics, stories, events, series: MarvelApiDTO.Element?

        enum CodingKeys: String, CodingKey {
            case id, name
            case resultDescription = "description"
            case resourceURI, urls, thumbnail, comics, stories, events, series
        }
    }
}

extension MarvelApiDTO.Character.Result: MarvelAPIDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let thumbnailUrl: URL? = {
            guard let path = thumbnail?.path, let ext = thumbnail?.thumbnailExtension else { return nil }
            return URL(string: path + "." + ext)
        }()

        return Marvel.MarvelEntity(
            id: id,
            name: name,
            description: resultDescription,
            source: .characters,
            thumbnailURL: thumbnailUrl
        )
    }
}
