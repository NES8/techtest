import Foundation

extension MarvelApiDTO.Comics {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let digitalID: Int?
        let title: String
        let issueNumber: Double?
        let variantDescription: String?
        let resultDescription: String?
        let modified, isbn, upc, diamondCode, ean, issn, format: String?
        let pageCount: Int?
        let textObjects: [TextObject]?
        let resourceURI: String?
        let urls: [MarvelApiDTO.URLElement]?
        let variants, collections, collectedIssues: [MarvelApiDTO.Item]?
        let dates: [DateElement]?
        let prices: [Price]?
        let thumbnail: MarvelApiDTO.Thumbnail?
        let images: [MarvelApiDTO.Thumbnail]?
        let series, creators, characters, stories, events: MarvelApiDTO.Item?

        enum CodingKeys: String, CodingKey {
            case id
            case digitalID = "digitalId"
            case title, issueNumber, variantDescription
            case resultDescription = "description"
            case modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, variants, collections, collectedIssues, dates, prices, thumbnail, images, creators, characters, stories, events
        }
    }

    // MARK: - DateElement
    struct DateElement: Decodable {
        let type, date: String
    }

    // MARK: - Price
    struct Price: Decodable {
        let type: String
        let price: Double
    }

    // MARK: - TextObject
    struct TextObject: Decodable {
        let type, language, text: String
    }
}

extension MarvelApiDTO.Comics.Result: MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let thumbnailUrl: URL? = {
            guard let path = thumbnail?.path, let ext = thumbnail?.thumbnailExtension else { return nil }
            return URL(string: path + "." + ext)
        }()

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: resultDescription,
            source: .comics,
            thumbnailURL: thumbnailUrl
        )
    }
}
