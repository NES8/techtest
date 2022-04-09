#if DEBUG

import XCTest
import Combine

extension XCTestCase {
    public func expect<T: Publisher>(
        _ publisher: T,
        toPublish values: [T.Output],
        timeout: TimeInterval = 10,
        file: StaticString = #file,
        line: UInt = #line
    ) throws where T.Output: Equatable {
        // Swift's Result type used  to keep track
        // of the result of our Combine pipeline:
        var result: Result<[T.Output], Error>?
        let expectation = self.expectation(description: "Awaiting publisher")

        let cancellable = publisher.collect(values.count).first().sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                case .finished:
                    break
                }
                expectation.fulfill()
            },
            receiveValue: { value in
                result = .success(value)
            }
        )

        // Await the expectation created at top of the test,
        // and once done, also it cancels cancellable to avoid getting
        // any unused variable warnings:
        waitForExpectations(timeout: timeout)
        cancellable.cancel()

        // Sent the original file and line number that
        // utility was called at, to tell XCTest to report
        // any encountered errors at that original call site:
        let unwrappedResult = try XCTUnwrap(
            result?.get(),
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )
        XCTAssertEqual(unwrappedResult, values)
    }

    public func expect<T: Publisher>(
        _ publisher: T,
        toPublish value: T.Output,
        timeout: TimeInterval = 10,
        file: StaticString = #file,
        line: UInt = #line
    ) throws where T.Output: Equatable {
        try expect(publisher, toPublish: [value])
    }
}

#endif
