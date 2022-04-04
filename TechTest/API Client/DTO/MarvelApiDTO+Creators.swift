import Foundation

extension MarvelApiDTO.Creators {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let firstName, middleName, lastName: String
        let suffix, fullName, resourceURI: String
        let urls: [MarvelApiDTO.URLElement]
        let thumbnail: MarvelApiDTO.Thumbnail
        let series, stories, comics, events: MarvelApiDTO.Element
    }
}

extension MarvelApiDTO.Creators.Result: MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let wikiUrl = urls.first(where: { $0.type == .wiki })?.url
        let detailUrl = urls.first(where: { $0.type == .detail })?.url
        let thumbnailUrl = URL(string: thumbnail.path + "/portrait_fantastic." + thumbnail.thumbnailExtension)
        let title = [firstName, middleName, lastName].joined(separator: " ")

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: "",
            source: .creators,
            thumbnailURL: thumbnailUrl,
            wikiURL: wikiUrl,
            detailURL: detailUrl
        )
    }
}
