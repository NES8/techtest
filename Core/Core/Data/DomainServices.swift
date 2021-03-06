import Foundation

public struct DataService: ServiceProvider {

    public var appTasks = [AppTask]()

    private let apiClient: MarvelAPIClient

    public init(path: String = "https://gateway.marvel.com") {
        self.apiClient = MarvelAPIClient(baseUrl: path)
    }

    public func modules() -> [Register] {
        [
            Register(SearchAPIClient.self) { self.apiClient },
            Register(DetailAPIClient.self) { self.apiClient },
        ]
    }
}
