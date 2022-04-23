// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Combine
import Foundation
@testable import Core


// MARK: - APIClient

open class APIClientMock: APIClient, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getCharacters(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`)))
		let perform = methodPerformValue(.m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))) as? (String?, Int) -> Void
		perform?(`nameStartsWith`, `pageSize`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getCharacters(nameStartsWith: String?, pageSize: Int). Use given")
			Failure("Stub return value not specified for getCharacters(nameStartsWith: String?, pageSize: Int). Use given")
		}
		return __value
    }

    open func getComics(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`)))
		let perform = methodPerformValue(.m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))) as? (String?, Int) -> Void
		perform?(`nameStartsWith`, `pageSize`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getComics(nameStartsWith: String?, pageSize: Int). Use given")
			Failure("Stub return value not specified for getComics(nameStartsWith: String?, pageSize: Int). Use given")
		}
		return __value
    }

    open func getCreators(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`)))
		let perform = methodPerformValue(.m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))) as? (String?, Int) -> Void
		perform?(`nameStartsWith`, `pageSize`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getCreators(nameStartsWith: String?, pageSize: Int). Use given")
			Failure("Stub return value not specified for getCreators(nameStartsWith: String?, pageSize: Int). Use given")
		}
		return __value
    }

    open func getEvents(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`)))
		let perform = methodPerformValue(.m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))) as? (String?, Int) -> Void
		perform?(`nameStartsWith`, `pageSize`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getEvents(nameStartsWith: String?, pageSize: Int). Use given")
			Failure("Stub return value not specified for getEvents(nameStartsWith: String?, pageSize: Int). Use given")
		}
		return __value
    }

    open func getSeries(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`)))
		let perform = methodPerformValue(.m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))) as? (String?, Int) -> Void
		perform?(`nameStartsWith`, `pageSize`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getSeries(nameStartsWith: String?, pageSize: Int). Use given")
			Failure("Stub return value not specified for getSeries(nameStartsWith: String?, pageSize: Int). Use given")
		}
		return __value
    }

    open func getStories(nameStartsWith: String?, pageSize: Int) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`)))
		let perform = methodPerformValue(.m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))) as? (String?, Int) -> Void
		perform?(`nameStartsWith`, `pageSize`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>.value(`nameStartsWith`), Parameter<Int>.value(`pageSize`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getStories(nameStartsWith: String?, pageSize: Int). Use given")
			Failure("Stub return value not specified for getStories(nameStartsWith: String?, pageSize: Int). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>, Parameter<Int>)
        case m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>, Parameter<Int>)
        case m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>, Parameter<Int>)
        case m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>, Parameter<Int>)
        case m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>, Parameter<Int>)
        case m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(Parameter<String?>, Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(let lhsNamestartswith, let lhsPagesize), .m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(let rhsNamestartswith, let rhsPagesize)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPagesize, rhs: rhsPagesize, with: matcher), lhsPagesize, rhsPagesize, "pageSize"))
				return Matcher.ComparisonResult(results)

            case (.m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(let lhsNamestartswith, let lhsPagesize), .m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(let rhsNamestartswith, let rhsPagesize)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPagesize, rhs: rhsPagesize, with: matcher), lhsPagesize, rhsPagesize, "pageSize"))
				return Matcher.ComparisonResult(results)

            case (.m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(let lhsNamestartswith, let lhsPagesize), .m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(let rhsNamestartswith, let rhsPagesize)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPagesize, rhs: rhsPagesize, with: matcher), lhsPagesize, rhsPagesize, "pageSize"))
				return Matcher.ComparisonResult(results)

            case (.m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(let lhsNamestartswith, let lhsPagesize), .m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(let rhsNamestartswith, let rhsPagesize)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPagesize, rhs: rhsPagesize, with: matcher), lhsPagesize, rhsPagesize, "pageSize"))
				return Matcher.ComparisonResult(results)

            case (.m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(let lhsNamestartswith, let lhsPagesize), .m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(let rhsNamestartswith, let rhsPagesize)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPagesize, rhs: rhsPagesize, with: matcher), lhsPagesize, rhsPagesize, "pageSize"))
				return Matcher.ComparisonResult(results)

            case (.m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(let lhsNamestartswith, let lhsPagesize), .m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(let rhsNamestartswith, let rhsPagesize)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPagesize, rhs: rhsPagesize, with: matcher), lhsPagesize, rhsPagesize, "pageSize"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(p0, p1): return p0.intValue + p1.intValue
            case let .m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(p0, p1): return p0.intValue + p1.intValue
            case let .m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(p0, p1): return p0.intValue + p1.intValue
            case let .m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(p0, p1): return p0.intValue + p1.intValue
            case let .m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(p0, p1): return p0.intValue + p1.intValue
            case let .m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize: return ".getCharacters(nameStartsWith:pageSize:)"
            case .m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize: return ".getComics(nameStartsWith:pageSize:)"
            case .m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize: return ".getCreators(nameStartsWith:pageSize:)"
            case .m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize: return ".getEvents(nameStartsWith:pageSize:)"
            case .m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize: return ".getSeries(nameStartsWith:pageSize:)"
            case .m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize: return ".getStories(nameStartsWith:pageSize:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getCharacters(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getComics(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getCreators(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getEvents(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getSeries(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getStories(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getCharacters(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getComics(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getCreators(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getEvents(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getSeries(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getStories(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getCharacters(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>) -> Verify { return Verify(method: .m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`))}
        public static func getComics(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>) -> Verify { return Verify(method: .m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`))}
        public static func getCreators(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>) -> Verify { return Verify(method: .m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`))}
        public static func getEvents(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>) -> Verify { return Verify(method: .m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`))}
        public static func getSeries(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>) -> Verify { return Verify(method: .m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`))}
        public static func getStories(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>) -> Verify { return Verify(method: .m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getCharacters(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, perform: @escaping (String?, Int) -> Void) -> Perform {
            return Perform(method: .m_getCharacters__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), performs: perform)
        }
        public static func getComics(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, perform: @escaping (String?, Int) -> Void) -> Perform {
            return Perform(method: .m_getComics__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), performs: perform)
        }
        public static func getCreators(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, perform: @escaping (String?, Int) -> Void) -> Perform {
            return Perform(method: .m_getCreators__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), performs: perform)
        }
        public static func getEvents(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, perform: @escaping (String?, Int) -> Void) -> Perform {
            return Perform(method: .m_getEvents__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), performs: perform)
        }
        public static func getSeries(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, perform: @escaping (String?, Int) -> Void) -> Perform {
            return Perform(method: .m_getSeries__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), performs: perform)
        }
        public static func getStories(nameStartsWith: Parameter<String?>, pageSize: Parameter<Int>, perform: @escaping (String?, Int) -> Void) -> Perform {
            return Perform(method: .m_getStories__nameStartsWith_nameStartsWithpageSize_pageSize(`nameStartsWith`, `pageSize`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetMarvelEntityUseCase

open class GetMarvelEntityUseCaseMock: GetMarvelEntityUseCase, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func callAsFunction(_ searchQuery: SearchQuery) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_callAsFunction__searchQuery(Parameter<SearchQuery>.value(`searchQuery`)))
		let perform = methodPerformValue(.m_callAsFunction__searchQuery(Parameter<SearchQuery>.value(`searchQuery`))) as? (SearchQuery) -> Void
		perform?(`searchQuery`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_callAsFunction__searchQuery(Parameter<SearchQuery>.value(`searchQuery`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for callAsFunction(_ searchQuery: SearchQuery). Use given")
			Failure("Stub return value not specified for callAsFunction(_ searchQuery: SearchQuery). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_callAsFunction__searchQuery(Parameter<SearchQuery>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_callAsFunction__searchQuery(let lhsSearchquery), .m_callAsFunction__searchQuery(let rhsSearchquery)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSearchquery, rhs: rhsSearchquery, with: matcher), lhsSearchquery, rhsSearchquery, "_ searchQuery"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_callAsFunction__searchQuery(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_callAsFunction__searchQuery: return ".callAsFunction(_:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func callAsFunction(_ searchQuery: Parameter<SearchQuery>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_callAsFunction__searchQuery(`searchQuery`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func callAsFunction(_ searchQuery: Parameter<SearchQuery>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_callAsFunction__searchQuery(`searchQuery`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func callAsFunction(_ searchQuery: Parameter<SearchQuery>) -> Verify { return Verify(method: .m_callAsFunction__searchQuery(`searchQuery`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func callAsFunction(_ searchQuery: Parameter<SearchQuery>, perform: @escaping (SearchQuery) -> Void) -> Perform {
            return Perform(method: .m_callAsFunction__searchQuery(`searchQuery`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

