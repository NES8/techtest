import Foundation
import Core

public struct MarvelListServiceProvider: ServiceProvider {
    public var appTasks: [AppTask] = []

    public init() {}

    public func modules() -> [Register] {
        [Register(MarvelListService.self) { MarvelListServiceLocator() } ]
    }
}
