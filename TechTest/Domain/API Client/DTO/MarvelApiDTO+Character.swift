import Foundation

extension MarvelApiDTO.Character {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let name, resultDescription: String
        let resourceURI: String
        let urls: [MarvelApiDTO.URLElement]
        let thumbnail: MarvelApiDTO.Thumbnail
        let comics, stories, events, series: MarvelApiDTO.Element

        enum CodingKeys: String, CodingKey {
            case id, name
            case resultDescription = "description"
            case resourceURI, urls, thumbnail, comics, stories, events, series
        }
    }
}

extension MarvelApiDTO.Character.Result: MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let wikiUrl = urls.first(where: { $0.type == .wiki })?.url
        let detailUrl = urls.first(where: { $0.type == .detail })?.url
        let thumbnailUrl = URL(string: thumbnail.path + "/portrait_fantastic." + thumbnail.thumbnailExtension)

        return Marvel.MarvelEntity(
            id: id,
            name: name,
            description: resultDescription,
            source: .character,
            thumbnailURL: thumbnailUrl,
            wikiURL: wikiUrl,
            detailURL: detailUrl
        )
    }
}
