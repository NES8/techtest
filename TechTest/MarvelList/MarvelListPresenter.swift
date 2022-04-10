import Foundation
import Combine
import Core

class MarvelListPresenter: BasePresenter {
    private weak var ui: MarvelListUI?
    private var cancelables = Set<AnyCancellable>()
    private let getCharacters = GetMarvelEntity()

    init(
        ui: MarvelListUI
    ) {
        self.ui = ui
    }

    func viewDidLoad() {
        loadData()
    }

    private func loadData() {
        ui?.showInitialLoading()
        
        getCharacters(type: .character)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard case .failure = completion else {
                    print("✅")
                    return
                }
                print("❌")
            }, receiveValue: { [weak self] characters in
                let viewModels = characters.map { MarvelListCollectionModel(entity: $0) }
                self?.ui?.show(items: viewModels)
            }).store(in: &cancelables)
    }
}
