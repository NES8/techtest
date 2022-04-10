import UIKit

protocol MarvelListUI: BaseUI {
    func showError()
    func show(items: [MarvelListCollectionModel])
}

class MarvelListViewController: BaseViewController {
    @IBOutlet private var collectionView: UICollectionView!

    private var collectionViewDataSource: MarvelListCollectionViewDataSource!


    var presenter: MarvelListPresenter!
    override var lifecyclePresenter: PresenterInterface? {
        return presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionViewDataSource = MarvelListCollectionViewDataSource()
        collectionViewDataSource.registerCells(collectionView: collectionView)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .never
    }
}

extension MarvelListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension MarvelListViewController: MarvelListUI {
    func showError() {
        fatalError()
    }

    func show(items: [MarvelListCollectionModel]) {
        collectionViewDataSource.items = items
        collectionView.reloadData()
        hideAllViewsExcept(collectionView)
    }
}
