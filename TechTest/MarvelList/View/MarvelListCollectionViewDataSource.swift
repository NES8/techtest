import UIKit

class MarvelListCollectionViewDataSource: NSObject {

    var items = [MarvelListCollectionModel]()

    func registerCells(collectionView: UICollectionView) {
        collectionView.register(reusableItem: MarvelListCollectionViewCell.self)
    }
}

extension MarvelListCollectionViewDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(reusableItem: MarvelListCollectionViewCell.self, for: indexPath)
        let item = items[indexPath.row]

        cell.setup(item)

        return cell
    }
}
