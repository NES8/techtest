import Foundation

extension MarvelApiDTO.Series {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let title, resultDescription, resourceURI: String
        let urls: [MarvelApiDTO.URLElement]
        let startYear, endYear, rating, modified: String
        let thumbnail: MarvelApiDTO.Thumbnail
        let comics, stories, events, characters, creators: MarvelApiDTO.Element
        let next, previous: MarvelApiDTO.Item

        enum CodingKeys: String, CodingKey {
            case id, title
            case resultDescription = "description"
            case resourceURI, urls, startYear, endYear, rating, modified, thumbnail, comics, stories, events, characters, creators, next, previous
        }
    }
}

extension MarvelApiDTO.Series.Result: MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let wikiUrl = urls.first(where: { $0.type == .wiki })?.url
        let detailUrl = urls.first(where: { $0.type == .detail })?.url
        let thumbnailUrl = URL(string: thumbnail.path + "/portrait_fantastic." + thumbnail.thumbnailExtension)

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: resultDescription,
            source: .series,
            thumbnailURL: thumbnailUrl,
            wikiURL: wikiUrl,
            detailURL: detailUrl
        )
    }
}
