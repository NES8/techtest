import Foundation

public struct ItemId: Hashable {
    public let id: String
    public let source: Marvel.Source

    public init(
        id: String,
        source: Marvel.Source
    ) {
        self.id = id
        self.source = source
    }
}
