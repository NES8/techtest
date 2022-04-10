import UIKit

protocol MarvelListUI: BaseUI {
    func showError()
    func show(items: [MarvelListCollectionModel])
}

class MarvelListViewController: BaseViewController {

    var presenter: MarvelListPresenter!
    override var lifecyclePresenter: PresenterInterface? {
        return presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MarvelListViewController: MarvelListUI {
    func showError() {
        fatalError()
    }

    func show(items: [MarvelListCollectionModel]) {
        
    }
}
