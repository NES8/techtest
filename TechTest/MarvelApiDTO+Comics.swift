import Foundation

extension MarvelApiDTO.Comics {

    // MARK: - Dto
    struct Dto: Decodable {
        let code: Int
        let status, copyright, attributionText, attributionHTML: String
        let data: DataClass
        let etag: String
    }

    // MARK: - DataClass
    struct DataClass: Decodable {
        let offset, limit, total, count: Int
        let results: [Result]
    }

    // MARK: - Result
    struct Result: Decodable {
        let id, digitalID, title, issueNumber: String
        let variantDescription, resultDescription, modified, isbn: String
        let upc, diamondCode, ean, issn: String
        let format, pageCount: String
        let textObjects: [TextObject]
        let resourceURI: String
        let urls: [URLElement]
        let series: MarvelApiDTO.SeriesElement
        let variants, collections, collectedIssues: [MarvelApiDTO.SeriesElement]
        let dates: [DateElement]
        let prices: [Price]
        let thumbnail: MarvelApiDTO.Thumbnail
        let images: [MarvelApiDTO.Thumbnail]
        let creators: MarvelApiDTO.CreatorsElement
        let characters: MarvelApiDTO.CharactersElement
        let stories: MarvelApiDTO.StoriesElement
        let events: MarvelApiDTO.EventsElement

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
        let type, price: String
    }

    // MARK: - TextObject
    struct TextObject: Decodable {
        let type, language, text: String
    }

    // MARK: - URLElement
    struct URLElement: Decodable {
        let type, url: String
    }

}
