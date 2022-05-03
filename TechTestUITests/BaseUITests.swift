import XCTest
import Shock
@testable import TechTest
@testable import Core

class BaseUITests: XCTestCase {
    var app: XCUIApplication!
    var mockServer: MockServer!
    var serviceLocator: CoreServiceLocator!

    override func setUp() {
        super.setUp()

        serviceLocator = CoreServiceLocator.shared

        mockServer = MockServer(port: 6789, bundle: Bundle(for: type(of: self)))
        mockServer.shouldSendNotFoundForMissingRoutes = true
        mockServer.start()
    }

    override func tearDown() {
        serviceLocator.removeAll()
        serviceLocator = nil

        mockServer.stop()
        super.tearDown()
    }
    
    // MARK: - Mock API

    func givenListMockedRequest(endpoint: MarvelAPIClient.Endpoint) {
        let route: MockHTTPRoute = .simple(
            method: .get,
            urlPath: endpoint.path,
            code: 200,
            filename: mockListJsonFileName(endpoint)
        )
        mockServer.setup(route: route)
    }

    private func mockListJsonFileName(_ endpoint: MarvelAPIClient.Endpoint) -> String {
        switch endpoint {
        case .characters:
            return "getCharacters.json"
        case .comics:
            return "getComics.json"
        case .creators:
            return "getCreators.json"
        case .events:
            return "getEvents.json"
        case .series:
            return "getSeries.json"
        case .stories:
            return "getStories.json"
        }
    }
    
    func givenDetailMockedRequest(endpoint: MarvelAPIClient.Endpoint, id: String) {
        let path = endpoint.path + "/" + id
        let route: MockHTTPRoute = .simple(
            method: .get,
            urlPath: path,
            code: 200,
            filename: mockDetailJsonFileName(endpoint))
        mockServer.setup(route: route)
    }
    
    private func mockDetailJsonFileName(_ endpoint: MarvelAPIClient.Endpoint) -> String {
        switch endpoint {
        case .characters:
            return "getCharacter.json"
        case .comics:
            return "getComic.json"
        case .creators:
            return "getCreator.json"
        case .events:
            return "getEvent.json"
        case .series:
            return "getSerie.json"
        case .stories:
            return "getStorie.json"
        }
    }

    // MARK: - Helpers

    func givenApp() {
        app = XCUIApplication()
        app.launchArguments.append("--uitest")
        app.launch()
    }

    func waitForElement(_ element: XCUIElement) -> Bool {
        element.waitForExistence(timeout: 5.0)
    }
}
