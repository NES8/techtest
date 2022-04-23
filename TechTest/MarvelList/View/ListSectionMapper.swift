import Core

struct ListSectionMapper {
    func map(_ category: ListSection.Category) -> Marvel.Source? {
        switch category {
        case .all:
            return nil
        case .characters:
            return .characters
        case .comics:
            return .comics
        case .creators:
            return .creators
        case .events:
            return .events
        case .series:
            return .series
        }
    }
}
