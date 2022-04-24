import UIKit

protocol DetailUI: BaseUI {
    func show(item: DetailViewModel)
}

class DetailViewController: BaseViewController {

    @IBOutlet private var nameLabel: UILabel!

    var presenter: DetailPresenter!
    override var lifecyclePresenter: PresenterInterface? {
        return presenter
    }
}

extension DetailViewController: DetailUI {
    func show(item: DetailViewModel) {
        nameLabel.text = item.name

        hideAllViews()
    }
}
