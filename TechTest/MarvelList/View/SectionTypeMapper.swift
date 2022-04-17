import Core

struct SectionTypeMapper {
    func map(_ sectionCategory: Section.Category) -> Marvel.Source? {
        switch sectionCategory {
        case .all:
            return nil
        case .characters:
            return .character
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
