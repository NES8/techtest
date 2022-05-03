import XCTest
@testable import Core
@testable import TechTest
import SwiftyMocky
import TestFoundation

// NOTE: Test language is forced to English

class DetailUITests: BaseUITests {

    private struct Texts {
        static let name = "Test 3-D Man"
        static let description = "Test 3-D Man description"
    }
    
    lazy var anyCharacter: Marvel.MarvelEntity = .init(id: 1011334, name: Texts.name, description: Texts.description, source: .characters, thumbnailURL: nil)
    
    var getSearchMock: GetSearchUseCaseMock!
    var getDetailMock: GetDetailUseCaseMock!

    override func setUp() {
        super.setUp()
                
        serviceLocator.add {
            Register(GetSearchUseCase.self) { self.getSearchMock }
            Register(GetDetailUseCase.self) { self.getDetailMock }
        }
        
        getSearchMock = GetSearchUseCaseMock()
        getDetailMock = GetDetailUseCaseMock()
    }
    
    override func tearDown() {
        getSearchMock = nil
        getDetailMock = nil
        
        super.tearDown()
    }
    
    func testFoo() {
        givenListFullMockedRequest()
        givenAnyCharacter()
        givenApp()
        
        let scrollView = app.collectionViews[A21r.List.collectionView.rawValue]
        let cell = scrollView.cells.containing(.staticText, identifier: "Cell Test 3-D Man").element
        cell.tap()
        cell.tap() //🤷🏻‍♂️

        let titleLabel = app.staticTexts["Test detail 3-D Man"]
        XCTAssertTrue(waitForElement(titleLabel))

        let descriptionLabel = app.staticTexts["Test detail 3-D Man description"]
        XCTAssertTrue(waitForElement(descriptionLabel))
    }
    
    // MARK: - Given

    private func givenListFullMockedRequest() {
        givenListMockedRequest(endpoint: .characters)
        givenListMockedRequest(endpoint: .comics)
        givenListMockedRequest(endpoint: .creators)
        givenListMockedRequest(endpoint: .events)
        givenListMockedRequest(endpoint: .series)
    }

    private func givenAnyCharacter() {
        givenDetailMockedRequest(endpoint: .characters, id: "1011334")
    }
}
