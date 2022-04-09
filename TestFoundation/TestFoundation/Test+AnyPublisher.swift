#if DEBUG
import Foundation
import Combine

extension AnyPublisher {
    public static func success(value: Output) -> AnyPublisher<Output, Failure> {
        return Future<Output, Failure> { future in
            future(.success(value))
        }
        .eraseToAnyPublisher()
    }

    public static func failure(error: Failure) -> AnyPublisher<Output, Failure> {
        return Future<Output, Failure> { future in
            future(.failure(error))
        }
        .eraseToAnyPublisher()
    }
}
#endif
