import XCTest
import Core
import Nimble

@testable import TechTest

class SectionCategorySourceInitTests: XCTestCase {

    func testSectionCategoryInitsFromCharactersIsCharacters() throws {
        let category: Section.Category? = .init(source: .characters)
        Nimble.expect(category).to(equal(.characters))
    }

    func testSectionCategoryInitsFromComicsIsComics() throws {
        let category: Section.Category? = .init(source: .comics)
        Nimble.expect(category).to(equal(.comics))
    }

    func testSectionCategoryInitsFromCreatorsIsCreators() throws {
        let category: Section.Category? = .init(source: .creators)
        Nimble.expect(category).to(equal(.creators))
    }

    func testSectionCategoryInitsFromEventsIsEvents() throws {
        let category: Section.Category? = .init(source: .events)
        Nimble.expect(category).to(equal(.events))
    }

    func testSectionCategoryInitsFromSeriesIsSeries() throws {
        let category: Section.Category? = .init(source: .series)
        Nimble.expect(category).to(equal(.series))
    }

    func testSectionCategoryInitsFromStoriesIsNil() throws {
        let category: Section.Category? = .init(source: .stories)
        Nimble.expect(category).to(beNil())
    }
}
