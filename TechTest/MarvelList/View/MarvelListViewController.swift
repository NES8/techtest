import UIKit
import Core

protocol MarvelListUI: AnyObject {
    func show(error: Error)
    func show(items: [MarvelListCollectionModel])
    func showEmptyCase()
}

class MarvelListViewController: UICollectionViewController {

    private var sections = [Section]()
    private lazy var dataSource = makeDataSource()
    private var searchController = UISearchController(searchResultsController: nil)
    private let sectionMapper = SectionTypeMapper()

    var presenter: MarvelListPresenter!

    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<Section, MarvelListCollectionModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MarvelListCollectionModel>

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        configureSearchController()
        configureLayout()
        configureNavigationBar()
        applySnapshot(animatingDifferences: false)
    }

    // MARK: - Functions

    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
                let cell = collectionView.dequeue(reusableItem: MarvelListCollectionViewCell.self, for: indexPath)
                cell.setup(item)
                return cell
            })
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else { return nil }

            let section = self.dataSource.snapshot()
                .sectionIdentifiers[indexPath.section]

            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: MarvelListSectionHeaderView.reuseIdentifier,
                for: indexPath) as? MarvelListSectionHeaderView

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

extension MarvelListViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        presenter.didSelectItem(id: item.id)
    }
}

// MARK: - UISearchResultsUpdating Delegate

extension MarvelListViewController: UISearchResultsUpdating {
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

    private func configureNavigationBar() {
        navigationItem.title = L10n.listTitle
        navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .search, target: self, action: #selector(showFilterOptions))
    }

    // MARK: Filter

    @objc private func showFilterOptions() {
        let alert = UIAlertController(title: L10n.listFilterMenuTitle, message: nil, preferredStyle: .actionSheet)

        Section.Category.allCases.forEach { category in
            alert.addAction(UIAlertAction(title: category.localizedTitle, style: .default , handler: { _ in
                self.didSelect(category: category)
            }))
        }

        if UIDevice.isIpad() {
            alert.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        }

        present(alert, animated: true)
    }

    private func didSelect(category: Section.Category) {
        presenter.didSelect(category: category)
    }
}

// MARK: - Layout Handling

extension MarvelListViewController {
    private func configureLayout() {
        collectionView.register(
            MarvelListSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MarvelListSectionHeaderView.reuseIdentifier
        )
        collectionView.register(reusableItem: MarvelListCollectionViewCell.self)

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

extension MarvelListViewController: MarvelListUI {

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

    func show(items: [MarvelListCollectionModel]) {
        var newSections = [Section]()

        Section.Category.allCases.forEach { category in
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
