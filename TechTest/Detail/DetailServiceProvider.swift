import Foundation
import Core

public struct DetailServiceProvider: ServiceProvider {
    public var appTasks: [AppTask] = []

    public init() {}

    public func modules() -> [Register] {
        [Register(DetailService.self) { DetailServiceLocator() } ]
    }
}
