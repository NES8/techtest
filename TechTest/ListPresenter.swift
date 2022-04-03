import Foundation
import Combine

class ListPresenter {
    private weak var ui: ListUI?
    private var cancelables = Set<AnyCancellable>()
    private let getCharacters = GetMarvelEntity()

    func didViewLoad() {
        getCharacters(type: .character)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard case .failure = completion else {
                    print("✅")
                    return
                }
                print("❌")
            }, receiveValue: { [weak self] characters in
                print(characters)
            }).store(in: &cancelables)
    }
}
