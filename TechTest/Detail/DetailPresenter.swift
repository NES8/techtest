import Foundation
import Core
import Combine

class DetailPresenter: BasePresenter {

    private let itemId: ItemId
    private weak var ui: DetailUI?
    private var cancelables = Set<AnyCancellable>()
    private var item: DetailViewModel?

    @Inject var getDetail: GetDetailUseCase

    init(
        itemId: ItemId,
        ui: DetailUI
    ) {
        self.itemId = itemId
        self.ui = ui
    }

    func viewWillAppear() {
        loadData()
    }

    private func loadData() {
        ui?.showInitialLoading()

        getDetail(itemId: itemId)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    guard let item = self.item else {
                        self.handleError(nil)
                        return
                    }
                    self.ui?.show(item: item)
                case .failure(let error):
                    self.handleError(error)
                }
            }, receiveValue: { [weak self] entity in
                guard let self = self,
                      let entity = entity else { return }
                self.item = DetailViewModel(entity: entity)
            }).store(in: &cancelables)
    }

    private func handleError(_ error: Error?) {

    }
}
