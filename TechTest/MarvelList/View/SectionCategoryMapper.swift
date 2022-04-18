import Core

struct SectionCategoryMapper {
    func map(_ category: Section.Category) -> Marvel.Source? {
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
