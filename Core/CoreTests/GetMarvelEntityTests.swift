import XCTest
import Combine
import SwiftyMocky
import Core

@testable import TechTest

class GetMarvelEntityTests: XCTestCase {

    var mockApiClient: APIClientMock!
    var getMarvelEntity: GetMarvelEntityUseCase!
    let anyCharacter = Marvel.MarvelEntity(id: 1, name: "name", description: "description", source: .character, thumbnailURL: nil, wikiURL: nil, detailURL: nil)

    override func setUp() {
        super.setUp()
        mockApiClient = APIClientMock()

        CoreServiceLocator.shared.add {
            Register(APIClient.self) { self.mockApiClient }
        }

        getMarvelEntity = GetMarvelEntity()
    }

    override func tearDown() {
        mockApiClient = nil
        getMarvelEntity = nil

        super.tearDown()
    }

    func testFetchesCharacters() throws {
        givenApiClientGetCharacterSucceeds()
        try expect(getMarvelEntity(type: .character), toPublish: [anyCharacter])
    }

    //MARK: Given

    private func givenApiClientGetCharacterSucceeds() {
        Given(mockApiClient, .getCharacters(
            willReturn: .success(value: [anyCharacter])
        ))
    }
}
