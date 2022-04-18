import Foundation

extension MarvelApiDTO.Creators {

    // MARK: - Result
    struct Result: Decodable {
        let id: Int
        let firstName, middleName, lastName: String
        let suffix, fullName, resourceURI: String?
        let urls: [MarvelApiDTO.URLElement]?
        let thumbnail: MarvelApiDTO.Thumbnail?
        let series, stories, comics, events: MarvelApiDTO.Element?
    }
}

extension MarvelApiDTO.Creators.Result: MarvelApiDomainEntity {
    var domainEntity: Marvel.MarvelEntity {
        let thumbnailUrl: URL? = {
            guard let path = thumbnail?.path, let ext = thumbnail?.thumbnailExtension else { return nil }
            return URL(string: path + "." + ext)
        }()
        let title = [firstName, middleName, lastName].joined(separator: " ")

        return Marvel.MarvelEntity(
            id: id,
            name: title,
            description: "",
            source: .creators,
            thumbnailURL: thumbnailUrl
        )
    }
}
