import Foundation

public struct DomainService: ServiceProvider {

    public var appTasks = [AppTask]()
    let path: String

    public init(path: String = "https://gateway.marvel.com") {
        self.path = path
    }

    public func modules() -> [Register] {
        [
            Register(APIClient.self) { MarvelAPIClient(baseUrl: path) },
            Register(GetMarvelEntityUseCase.self) { GetMarvelEntity() },
        ]
    }
}
