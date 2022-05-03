import Foundation

public struct DomainService: ServiceProvider {

    public var appTasks = [AppTask]()

    public init() {}

    public func modules() -> [Register] {
        [
            Register(GetSearchUseCase.self) { GetSearch() },
            Register(GetDetailUseCase.self) { GetDetail() },
        ]
    }
}
