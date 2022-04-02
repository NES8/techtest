import Foundation

extension MarvelApiDTO.Character {

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

extension MarvelApiDTO.Character.Result {
    var domainCharacter: Marvel.Character {
        let wikiUrl = urls.first(where: { $0.type == .wiki })?.url
        let detailUrl = urls.first(where: { $0.type == .detail })?.url
        let thumbnailUrl = URL(string: thumbnail.path + "/portrait_fantastic." + thumbnail.thumbnailExtension)

        return Marvel.Character(id: id,
                                name: name,
                                description: resultDescription,
                                thumbnailURL: thumbnailUrl,
                                wikiURL: wikiUrl,
                                detailURL: detailUrl)
    }
}
