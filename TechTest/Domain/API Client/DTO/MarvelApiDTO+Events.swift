import Foundation

extension MarvelApiDTO.Events {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let title, resultDescription, resourceURI: String
        let urls: [MarvelApiDTO.URLElement]
        let modified, start, end: String
        let thumbnail: MarvelApiDTO.Thumbnail
        let comics, stories, series, characters, creators: MarvelApiDTO.Element
        let next, previous: MarvelApiDTO.Item

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, urls, modified, start, end, thumbnail, comics, stories, series, characters, creators, next, previous
        }
    }
}

extension MarvelApiDTO.Events.Result: MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let wikiUrl = urls.first(where: { $0.type == .wiki })?.url
        let detailUrl = urls.first(where: { $0.type == .detail })?.url
        let thumbnailUrl = URL(string: thumbnail.path + "/portrait_fantastic." + thumbnail.thumbnailExtension)

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: resultDescription,
            source: .events,
            thumbnailURL: thumbnailUrl,
            wikiURL: wikiUrl,
            detailURL: detailUrl
        )
    }
}
