import XCTest
import Core
import Nimble

@testable import TechTest

class SectionCategoryMapperTests: XCTestCase {

    var sut: SectionCategoryMapper!

    override func setUp() {
        super.setUp()

        sut = SectionCategoryMapper()
    }

    override func tearDown() {
        sut = nil

        super.tearDown()
    }

    func testSectionCategoryMapperFromCharactersToCharacters() throws {
        let source = sut.map(.characters)
        Nimble.expect(source).to(equal(.characters))
    }

    func testSectionCategoryMapperFromComicsToComics() throws {
        let source = sut.map(.comics)
        Nimble.expect(source).to(equal(.comics))
    }

    func testSectionCategoryMapperFromCreatorsToCreators() throws {
        let source = sut.map(.creators)
        Nimble.expect(source).to(equal(.creators))
    }

    func testSectionCategoryMapperFromEventsToEvents() throws {
        let source = sut.map(.events)
        Nimble.expect(source).to(equal(.events))
    }

    func testSectionCategoryMapperFromSeriesToSeries() throws {
        let source = sut.map(.series)
        Nimble.expect(source).to(equal(.series))
    }

    func testSectionCategoryMapperFromAllToNil() throws {
        let source = sut.map(.all)
        Nimble.expect(source).to(beNil())
    }
}
