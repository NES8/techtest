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

    func givenListMockedRequest(endpoint: MarvelAPIClient.Endpoint) {
        let route: MockHTTPRoute = .simple(
            method: .get,
            urlPath: endpoint.path,
            code: 200,
            filename: mockJsonFileName(endpoint)
        )
        mockServer.setup(route: route)
    }

    private func mockJsonFileName(_ endpoint: MarvelAPIClient.Endpoint) -> String {
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

    func givenApp() {
        app = XCUIApplication()
        app.launchArguments.append("--uitest")
        app.launch()
    }

    func waitForElement(_ element: XCUIElement) -> Bool {
        element.waitForExistence(timeout: 5.0)
    }
}
