import XCTest
//import Core
@testable import Core
@testable import TechTest

// NOTE: Test language is forced to English
// Edit Scheme... -> Test -> Options -> App Language

class TechTestUITests: BaseUITests {
    private let title = "Test 3-D Man"

    func testListWithCharacters() throws {
        givenListFullMockedRequest()
        givenApp()

        let scrollView = app.collectionViews[A21r.List.collectionView.rawValue]
        XCTAssertTrue(waitForElement(scrollView))

        let cell = app.staticTexts[A21r.List.Cell.content(title: title).rawValue]
        XCTAssertTrue(waitForElement(cell))
    }
/*
 case all
 case characters
 case comics
 case creators
 case events
 case series

 */
    func testListFilterByComics() {
        givenListFullMockedRequest()
        givenApp()

        let navigationBar = app.navigationBars["Marvel Universe"]
        let searchBarButton = navigationBar.buttons["Search"]

        searchBarButton.tap()

        let actionSheet = app.sheets["Filter"]
        let comicsButton = actionSheet.scrollViews.otherElements.buttons["Comics"]

        comicsButton.tap()
        comicsButton.tap()

        let cell = app.staticTexts["Marvel Previews (2017)"]
        XCTAssertTrue(waitForElement(cell))
    }

    private func givenListFullMockedRequest() {
        givenListMockedRequest(endpoint: .characters)
        givenListMockedRequest(endpoint: .comics)
        givenListMockedRequest(endpoint: .creators)
        givenListMockedRequest(endpoint: .events)
        givenListMockedRequest(endpoint: .series)
    }
}
