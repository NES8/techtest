import UIKit

protocol DetailUI: BaseUI {
    func show()
}

class DetailViewController: BaseViewController {

    var presenter: DetailPresenter!
    override var lifecyclePresenter: PresenterInterface? {
        return presenter
    }

}

extension DetailViewController: DetailUI {
    func show() {
        view.backgroundColor = .red
    }
}
