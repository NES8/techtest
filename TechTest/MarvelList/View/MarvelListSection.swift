import Core

class Section: Hashable {
    enum `Type`: String {
        case characters
        case comics
        case creators
        case events
        case series
    }

    let id: String
    let title: String
    let models: [MarvelListCollectionModel]

    init(type: `Type`, models: [MarvelListCollectionModel]) {
        self.id = type.rawValue
        self.title = type.rawValue.capitalized
        self.models = models
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.id == rhs.id
    }
}

