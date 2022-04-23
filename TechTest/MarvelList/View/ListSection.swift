import Core

class ListSection: Hashable {
    enum Category: CaseIterable {
        case all
        case characters
        case comics
        case creators
        case events
        case series

        init?(source: Marvel.Source) {
            switch source {
            case .characters:
                self = .characters
            case .comics:
                self = .comics
            case .creators:
                self = .creators
            case .events:
                self = .events
            case .series:
                self = .series
            case .stories:
                return nil
            }
        }

        var localizedTitle: String {
            switch self {
            case .all:
                return L10n.listSectionTitleAll
            case .characters:
                return L10n.listSectionTitleCharacters
            case .comics:
                return L10n.listSectionTitleComics
            case .creators:
                return L10n.listSectionTitleCreators
            case .events:
                return L10n.listSectionTitleEvents
            case .series:
                return L10n.listSectionTitleSeries
            }
        }
    }

    let id: String
    let title: String
    let models: [ListCollectionModel]

    init(category: Category, models: [ListCollectionModel]) {
        self.id = String(category.hashValue)
        self.title = category.localizedTitle
        self.models = models
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: ListSection, rhs: ListSection) -> Bool {
        lhs.id == rhs.id
    }
}
