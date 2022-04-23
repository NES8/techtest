import Foundation
import Core

public struct ListServiceProvider: ServiceProvider {
    public var appTasks: [AppTask] = []

    public init() {}

    public func modules() -> [Register] {
        [Register(ListService.self) { ListServiceLocator() } ]
    }
}
