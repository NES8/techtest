import Foundation

// A21r = AccessibilityIdentifiers 😀
struct A21r {
    enum List: String {
        case collectionView
        case searchBarButton
        case navigationBar

        enum Cell {
            case content(title: String)

            var rawValue: String {
                switch self {
                case .content(let title):
                    return "Cell \(title)"
                }
            }

        }
    }
}
