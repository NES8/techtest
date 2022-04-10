import UIKit

protocol ReusableItem {
    static var nibName: String { get }
    static var reuseIdentifier: String { get }
}

extension ReusableItem where Self: UICollectionViewCell {
    static var nibName: String {
        return String(describing: self)
    }

    static var reuseIdentifier: String {
        return nibName
    }
}

extension UICollectionViewCell: ReusableItem {}

extension UICollectionView {

    func register<T>(reusableItem: T.Type) where T: ReusableItem {
        let nib = UINib(nibName: reusableItem.nibName, bundle: Bundle.main)
        register(nib, forCellWithReuseIdentifier: reusableItem.reuseIdentifier)
    }

    func registerNib(nibName name: String, forCellReuseIdentifier identifier: String) {
        register(
            UINib(nibName: name, bundle: Bundle.main),
            forCellWithReuseIdentifier: identifier
        )
    }

    func registerNib(nibName name: String, forHeaderWithReuseIdentifier identifier: String) {
        register(
            UINib(nibName: name, bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: identifier
        )
    }

    func registerNib(nibName name: String, forFooterWithReuseIdentifier identifier: String) {
        register(
            UINib(nibName: name, bundle: Bundle.main),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: identifier
        )
    }
}

extension UICollectionView {

    func dequeue<T: ReusableItem>(reusableItem: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: reusableItem.reuseIdentifier, for: indexPath) as! T
    }
}
