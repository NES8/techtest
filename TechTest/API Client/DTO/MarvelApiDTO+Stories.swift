import Foundation

extension MarvelApiDTO.Stories {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let title, resultDescription, resourceURI: String
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

extension MarvelApiDTO.Stories.Result: MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let thumbnailUrl = URL(string: thumbnail.path + "/portrait_fantastic." + thumbnail.thumbnailExtension)

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: resultDescription,
            source: .stories,
            thumbnailURL: thumbnailUrl,
            wikiURL: nil,
            detailURL: nil
        )
    }
}
