import Foundation

class DetailPresenter: BasePresenter {

    private let id: String
    private weak var ui: DetailUI?

    init(
        id: String,
        ui: DetailUI
    ) {
        self.id = id
        self.ui = ui
    }

    func viewWillAppear() {
        loadData()
    }

    private func loadData() {
        ui?.show()
    }
}
