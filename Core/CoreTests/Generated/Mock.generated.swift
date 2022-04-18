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





    open func getCharacters(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getCharacters__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`)))
		let perform = methodPerformValue(.m_getCharacters__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))) as? (String?) -> Void
		perform?(`nameStartsWith`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getCharacters__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getCharacters(nameStartsWith: String?). Use given")
			Failure("Stub return value not specified for getCharacters(nameStartsWith: String?). Use given")
		}
		return __value
    }

    open func getComics(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getComics__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`)))
		let perform = methodPerformValue(.m_getComics__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))) as? (String?) -> Void
		perform?(`nameStartsWith`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getComics__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getComics(nameStartsWith: String?). Use given")
			Failure("Stub return value not specified for getComics(nameStartsWith: String?). Use given")
		}
		return __value
    }

    open func getCreators(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getCreators__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`)))
		let perform = methodPerformValue(.m_getCreators__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))) as? (String?) -> Void
		perform?(`nameStartsWith`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getCreators__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getCreators(nameStartsWith: String?). Use given")
			Failure("Stub return value not specified for getCreators(nameStartsWith: String?). Use given")
		}
		return __value
    }

    open func getEvents(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getEvents__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`)))
		let perform = methodPerformValue(.m_getEvents__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))) as? (String?) -> Void
		perform?(`nameStartsWith`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getEvents__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getEvents(nameStartsWith: String?). Use given")
			Failure("Stub return value not specified for getEvents(nameStartsWith: String?). Use given")
		}
		return __value
    }

    open func getSeries(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getSeries__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`)))
		let perform = methodPerformValue(.m_getSeries__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))) as? (String?) -> Void
		perform?(`nameStartsWith`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getSeries__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getSeries(nameStartsWith: String?). Use given")
			Failure("Stub return value not specified for getSeries(nameStartsWith: String?). Use given")
		}
		return __value
    }

    open func getStories(nameStartsWith: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_getStories__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`)))
		let perform = methodPerformValue(.m_getStories__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))) as? (String?) -> Void
		perform?(`nameStartsWith`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_getStories__nameStartsWith_nameStartsWith(Parameter<String?>.value(`nameStartsWith`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getStories(nameStartsWith: String?). Use given")
			Failure("Stub return value not specified for getStories(nameStartsWith: String?). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getCharacters__nameStartsWith_nameStartsWith(Parameter<String?>)
        case m_getComics__nameStartsWith_nameStartsWith(Parameter<String?>)
        case m_getCreators__nameStartsWith_nameStartsWith(Parameter<String?>)
        case m_getEvents__nameStartsWith_nameStartsWith(Parameter<String?>)
        case m_getSeries__nameStartsWith_nameStartsWith(Parameter<String?>)
        case m_getStories__nameStartsWith_nameStartsWith(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getCharacters__nameStartsWith_nameStartsWith(let lhsNamestartswith), .m_getCharacters__nameStartsWith_nameStartsWith(let rhsNamestartswith)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				return Matcher.ComparisonResult(results)

            case (.m_getComics__nameStartsWith_nameStartsWith(let lhsNamestartswith), .m_getComics__nameStartsWith_nameStartsWith(let rhsNamestartswith)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				return Matcher.ComparisonResult(results)

            case (.m_getCreators__nameStartsWith_nameStartsWith(let lhsNamestartswith), .m_getCreators__nameStartsWith_nameStartsWith(let rhsNamestartswith)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				return Matcher.ComparisonResult(results)

            case (.m_getEvents__nameStartsWith_nameStartsWith(let lhsNamestartswith), .m_getEvents__nameStartsWith_nameStartsWith(let rhsNamestartswith)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				return Matcher.ComparisonResult(results)

            case (.m_getSeries__nameStartsWith_nameStartsWith(let lhsNamestartswith), .m_getSeries__nameStartsWith_nameStartsWith(let rhsNamestartswith)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				return Matcher.ComparisonResult(results)

            case (.m_getStories__nameStartsWith_nameStartsWith(let lhsNamestartswith), .m_getStories__nameStartsWith_nameStartsWith(let rhsNamestartswith)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNamestartswith, rhs: rhsNamestartswith, with: matcher), lhsNamestartswith, rhsNamestartswith, "nameStartsWith"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getCharacters__nameStartsWith_nameStartsWith(p0): return p0.intValue
            case let .m_getComics__nameStartsWith_nameStartsWith(p0): return p0.intValue
            case let .m_getCreators__nameStartsWith_nameStartsWith(p0): return p0.intValue
            case let .m_getEvents__nameStartsWith_nameStartsWith(p0): return p0.intValue
            case let .m_getSeries__nameStartsWith_nameStartsWith(p0): return p0.intValue
            case let .m_getStories__nameStartsWith_nameStartsWith(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getCharacters__nameStartsWith_nameStartsWith: return ".getCharacters(nameStartsWith:)"
            case .m_getComics__nameStartsWith_nameStartsWith: return ".getComics(nameStartsWith:)"
            case .m_getCreators__nameStartsWith_nameStartsWith: return ".getCreators(nameStartsWith:)"
            case .m_getEvents__nameStartsWith_nameStartsWith: return ".getEvents(nameStartsWith:)"
            case .m_getSeries__nameStartsWith_nameStartsWith: return ".getSeries(nameStartsWith:)"
            case .m_getStories__nameStartsWith_nameStartsWith: return ".getStories(nameStartsWith:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getCharacters(nameStartsWith: Parameter<String?>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getCharacters__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getComics(nameStartsWith: Parameter<String?>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getComics__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getCreators(nameStartsWith: Parameter<String?>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getCreators__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getEvents(nameStartsWith: Parameter<String?>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getEvents__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getSeries(nameStartsWith: Parameter<String?>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getSeries__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getStories(nameStartsWith: Parameter<String?>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_getStories__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getCharacters(nameStartsWith: Parameter<String?>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getCharacters__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getComics(nameStartsWith: Parameter<String?>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getComics__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getCreators(nameStartsWith: Parameter<String?>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getCreators__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getEvents(nameStartsWith: Parameter<String?>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getEvents__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getSeries(nameStartsWith: Parameter<String?>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getSeries__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func getStories(nameStartsWith: Parameter<String?>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_getStories__nameStartsWith_nameStartsWith(`nameStartsWith`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getCharacters(nameStartsWith: Parameter<String?>) -> Verify { return Verify(method: .m_getCharacters__nameStartsWith_nameStartsWith(`nameStartsWith`))}
        public static func getComics(nameStartsWith: Parameter<String?>) -> Verify { return Verify(method: .m_getComics__nameStartsWith_nameStartsWith(`nameStartsWith`))}
        public static func getCreators(nameStartsWith: Parameter<String?>) -> Verify { return Verify(method: .m_getCreators__nameStartsWith_nameStartsWith(`nameStartsWith`))}
        public static func getEvents(nameStartsWith: Parameter<String?>) -> Verify { return Verify(method: .m_getEvents__nameStartsWith_nameStartsWith(`nameStartsWith`))}
        public static func getSeries(nameStartsWith: Parameter<String?>) -> Verify { return Verify(method: .m_getSeries__nameStartsWith_nameStartsWith(`nameStartsWith`))}
        public static func getStories(nameStartsWith: Parameter<String?>) -> Verify { return Verify(method: .m_getStories__nameStartsWith_nameStartsWith(`nameStartsWith`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getCharacters(nameStartsWith: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getCharacters__nameStartsWith_nameStartsWith(`nameStartsWith`), performs: perform)
        }
        public static func getComics(nameStartsWith: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getComics__nameStartsWith_nameStartsWith(`nameStartsWith`), performs: perform)
        }
        public static func getCreators(nameStartsWith: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getCreators__nameStartsWith_nameStartsWith(`nameStartsWith`), performs: perform)
        }
        public static func getEvents(nameStartsWith: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getEvents__nameStartsWith_nameStartsWith(`nameStartsWith`), performs: perform)
        }
        public static func getSeries(nameStartsWith: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getSeries__nameStartsWith_nameStartsWith(`nameStartsWith`), performs: perform)
        }
        public static func getStories(nameStartsWith: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_getStories__nameStartsWith_nameStartsWith(`nameStartsWith`), performs: perform)
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





    open func callAsFunction(type: Marvel.Source, filter: String?) -> AnyPublisher<[Marvel.MarvelEntity], Error> {
        addInvocation(.m_callAsFunction__type_typefilter_filter(Parameter<Marvel.Source>.value(`type`), Parameter<String?>.value(`filter`)))
		let perform = methodPerformValue(.m_callAsFunction__type_typefilter_filter(Parameter<Marvel.Source>.value(`type`), Parameter<String?>.value(`filter`))) as? (Marvel.Source, String?) -> Void
		perform?(`type`, `filter`)
		var __value: AnyPublisher<[Marvel.MarvelEntity], Error>
		do {
		    __value = try methodReturnValue(.m_callAsFunction__type_typefilter_filter(Parameter<Marvel.Source>.value(`type`), Parameter<String?>.value(`filter`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for callAsFunction(type: Marvel.Source, filter: String?). Use given")
			Failure("Stub return value not specified for callAsFunction(type: Marvel.Source, filter: String?). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_callAsFunction__type_typefilter_filter(Parameter<Marvel.Source>, Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_callAsFunction__type_typefilter_filter(let lhsType, let lhsFilter), .m_callAsFunction__type_typefilter_filter(let rhsType, let rhsFilter)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher), lhsType, rhsType, "type"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsFilter, rhs: rhsFilter, with: matcher), lhsFilter, rhsFilter, "filter"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_callAsFunction__type_typefilter_filter(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_callAsFunction__type_typefilter_filter: return ".callAsFunction(type:filter:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func callAsFunction(type: Parameter<Marvel.Source>, filter: Parameter<String?>, willReturn: AnyPublisher<[Marvel.MarvelEntity], Error>...) -> MethodStub {
            return Given(method: .m_callAsFunction__type_typefilter_filter(`type`, `filter`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func callAsFunction(type: Parameter<Marvel.Source>, filter: Parameter<String?>, willProduce: (Stubber<AnyPublisher<[Marvel.MarvelEntity], Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<[Marvel.MarvelEntity], Error>] = []
			let given: Given = { return Given(method: .m_callAsFunction__type_typefilter_filter(`type`, `filter`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[Marvel.MarvelEntity], Error>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func callAsFunction(type: Parameter<Marvel.Source>, filter: Parameter<String?>) -> Verify { return Verify(method: .m_callAsFunction__type_typefilter_filter(`type`, `filter`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func callAsFunction(type: Parameter<Marvel.Source>, filter: Parameter<String?>, perform: @escaping (Marvel.Source, String?) -> Void) -> Perform {
            return Perform(method: .m_callAsFunction__type_typefilter_filter(`type`, `filter`), performs: perform)
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

