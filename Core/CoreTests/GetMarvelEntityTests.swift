import XCTest
import Combine
import SwiftyMocky
import Core
import TestFoundation

@testable import TechTest

class GetMarvelEntityTests: XCTestCase {

    var mockApiClient: APIClientMock!
    var getMarvelEntity: GetSearchUseCase!
    let anyMarvelEntity = Marvel.MarvelEntity(id: 1, name: "name", description: "description", source: .characters, thumbnailURL: nil)

    override func setUp() {
        super.setUp()
        mockApiClient = APIClientMock()

        CoreServiceLocator.shared.add {
            Register(SearchAPIClient.self) { self.mockApiClient }
        }

        getMarvelEntity = GetSearch()
    }

    override func tearDown() {
        mockApiClient = nil
        getMarvelEntity = nil

        super.tearDown()
    }

    func testFetchesCharacters() throws {
        givenApiClientGetCharacterSucceeds()
        let searchQuery = SearchQuery(type: .characters, filter: nil, pageSize: .small)
        try expect(getMarvelEntity(searchQuery), toPublish: [anyMarvelEntity])
    }

    //MARK: Given

    private func givenApiClientGetCharacterSucceeds() {
        Given(mockApiClient, .getCharacters(
            nameStartsWith: nil, pageSize: 3, willReturn: .success(value: [anyMarvelEntity])
        ))
    }
}
