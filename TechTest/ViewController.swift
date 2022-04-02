import UIKit

protocol ListUI: AnyObject {
    func showError()
}

class ViewController: UIViewController {

    var presenter: ListPresenter = ListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.didViewLoad()
    }
}

extension ViewController: ListUI {
    func showError() {
        fatalError()
    }
}
