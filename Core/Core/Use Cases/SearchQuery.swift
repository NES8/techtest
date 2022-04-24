import Foundation

public struct SearchQuery {

    public enum PageSize: Int {
        case small = 3
        case big = 30
    }

    public init(
        type: Marvel.Source,
        filter: String?,
        pageSize: PageSize
    ) {
        self.type = type
        self.filter = filter
        self.pageSize = pageSize
    }

    let type: Marvel.Source
    let filter: String?
    let pageSize: PageSize
}
