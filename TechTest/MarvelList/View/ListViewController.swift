import UIKit
import Core

protocol ListUI: AnyObject {
    func show(error: Error)
    func show(items: [ListCollectionModel])
    func showEmptyCase()
}

class ListViewController: UICollectionViewController {

    private var sections = [ListSection]()
    private lazy var dataSource = makeDataSource()
    private var searchController = UISearchController(searchResultsController: nil)
    private let sectionMapper = ListSectionMapper()

    var presenter: ListPresenter!

    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<ListSection, ListCollectionModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ListSection, ListCollectionModel>

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        configureSearchController()
        configureLayout()
        configureNavigationBar()
        configureAccessibilityIdentifiers()

        applySnapshot(animatingDifferences: false)

    }

    private func configureNavigationBar() {
        let searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showFilterOptions))
        searchBarButton.accessibilityIdentifier = A21r.List.searchBarButton.rawValue

        navigationItem.title = L10n.listTitle
        navigationItem.leftBarButtonItem = searchBarButton
        navigationItem.titleView?.accessibilityIdentifier = A21r.List.navigationBar.rawValue
    }

    private func configureAccessibilityIdentifiers() {
        collectionView.accessibilityIdentifier = A21r.List.collectionView.rawValue
    }

    // MARK: Filter

    @objc private func showFilterOptions() {
        let alert = UIAlertController(title: L10n.listFilterMenuTitle, message: nil, preferredStyle: .actionSheet)

        ListSection.Category.allCases.forEach { category in
            alert.addAction(UIAlertAction(title: category.localizedTitle, style: .default , handler: { _ in
                self.didSelect(category: category)
            }))
        }

        if UIDevice.isIpad() {
            alert.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        }

        present(alert, animated: true)
    }

    private func didSelect(category: ListSection.Category) {
        presenter.didSelect(category: category)
    }

    // MARK: - CollectionView

    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
                let cell = collectionView.dequeue(reusableItem: ListCollectionViewCell.self, for: indexPath)
                cell.setup(item)
                return cell
            })
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else { return nil }

            let section = self.dataSource.snapshot()
                .sectionIdentifiers[indexPath.section]

            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ListSectionHeaderView.reuseIdentifier,
                for: indexPath) as? ListSectionHeaderView

            view?.titleLabel.text = section.title
            return view
        }
        return dataSource
    }

    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()

        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(section.models, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

// MARK: - UICollectionViewDataSource

extension ListViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        presenter.didSelectItem(id: item.id)
    }
}

// MARK: - UISearchResultsUpdating Delegate

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.didChange(filter: searchController.searchBar.text)
        applySnapshot()
    }

    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = L10n.listSearchPlaceholder
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

// MARK: - Layout Handling

extension ListViewController {
    private func configureLayout() {
        collectionView.register(
            ListSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ListSectionHeaderView.reuseIdentifier
        )
        collectionView.register(reusableItem: ListCollectionViewCell.self)

        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let isPhone = layoutEnvironment.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.phone
            let size = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                heightDimension: NSCollectionLayoutDimension.absolute(isPhone ? 280 : 250)
            )
            let itemCount = isPhone ? 1 : 3
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: itemCount)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            section.interGroupSpacing = 10

            let headerFooterSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(20)
            )
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        })
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}

extension ListViewController: ListUI {

    func show(error: Error) {
        let alert = UIAlertController(title: L10n.messageViewErrorUnknowTitle,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(.init(title: L10n.messageViewDefaultAnswerButtonTitle, style: .default))
        present(alert, animated: true)
    }

    func showEmptyCase() {
        let alert = UIAlertController(title: L10n.messageViewErrorUnknowTitle,
                                      message: L10n.messageViewErrorUnknowDescription,
                                      preferredStyle: .alert)
        alert.addAction(.init(title: L10n.messageViewDefaultAnswerButtonTitle, style: .default))
        present(alert, animated: true)
    }

    func show(items: [ListCollectionModel]) {
        var newSections = [ListSection]()

        ListSection.Category.allCases.forEach { category in
            let categoryItems = items.filter({
                guard let itemCategory = $0.category else { return false }
                return itemCategory == category
            })

            if !categoryItems.isEmpty {
                newSections.append(.init(category: category, models: categoryItems))
            }
        }

        sections = newSections
        applySnapshot()
    }
}
