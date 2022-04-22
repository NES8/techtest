import XCTest
//import Core
@testable import Core
@testable import TechTest

// NOTE: Test language is forced to English
// Edit Scheme... -> Test -> Options -> App Language

class TechTestUITests: BaseUITests {

    private struct Texts {
        static let characterTitle = "Test 3-D Man"
        static let comicsTitle = "Test Marvel Previews (2017)"
        static let creatorsTitle = "Test #O  "
        static let eventsTitle = "Test Acts of Vengeance!"
        static let seriesTitle = "Test Fantastic Four by Dan Slott Vol. 1 (2021)"
    }

    func testListWithCharacters() throws {
        givenListFullMockedRequest()
        givenApp()

        let scrollView = app.collectionViews[A21r.List.collectionView.rawValue]
        XCTAssertTrue(waitForElement(scrollView))

        let cell = app.staticTexts[A21r.List.Cell.content(title: Texts.characterTitle).rawValue]
        XCTAssertTrue(waitForElement(cell))
    }

    func testListFilterByComics() {
        givenListFullMockedRequest()
        givenApp()

        openSearchFilter()

        let optionButton = actionSheetFilterButtons["Comics"]
        optionButton.tap()
        optionButton.tap()

        let cell = app.staticTexts[Texts.comicsTitle]
        XCTAssertTrue(waitForElement(cell))
    }

    func testListFilterByCreators() {
        givenListFullMockedRequest()
        givenApp()

        openSearchFilter()

        let optionButton = actionSheetFilterButtons["Creators"]
        optionButton.tap()
        optionButton.tap()

        let cell = app.staticTexts[Texts.creatorsTitle]
        XCTAssertTrue(waitForElement(cell))
    }

    func testListFilterByEvents() {
        givenListFullMockedRequest()
        givenApp()

        openSearchFilter()

        let optionButton = actionSheetFilterButtons["Events"]
        optionButton.tap()
        optionButton.tap()

        let cell = app.staticTexts[Texts.eventsTitle]
        XCTAssertTrue(waitForElement(cell))
    }

    func testListFilterBySeries() {
        givenListFullMockedRequest()
        givenApp()

        openSearchFilter()

        let optionButton = actionSheetFilterButtons["Series"]
        optionButton.tap()
        optionButton.tap()

        let cell = app.staticTexts[Texts.seriesTitle]
        XCTAssertTrue(waitForElement(cell))
    }

    // MARK: - Actions

    private func openSearchFilter() {
        let navigationBar = app.navigationBars["Marvel Universe"]
        let searchBarButton = navigationBar.buttons["Search"]

        searchBarButton.tap()
    }

    private var actionSheetFilterButtons: XCUIElementQuery {
        let actionSheet = app.sheets["Filter"]
        return actionSheet.scrollViews.otherElements.buttons
    }

    // MARK: - Given

    private func givenListFullMockedRequest() {
        givenListMockedRequest(endpoint: .characters)
        givenListMockedRequest(endpoint: .comics)
        givenListMockedRequest(endpoint: .creators)
        givenListMockedRequest(endpoint: .events)
        givenListMockedRequest(endpoint: .series)
    }
}
