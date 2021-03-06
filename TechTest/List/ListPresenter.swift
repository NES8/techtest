import Foundation
import Combine
import Core

class ListPresenter {
    private weak var ui: ListUI?
    private var cancellables = Set<AnyCancellable>()
    private var selectedCategory: ListSection.Category = .all
    private var startsWithFilter: String?
    private let router: ListRoutable

    @Inject var getSearch: GetSearchUseCase


    init(
        ui: ListUI,
        router: ListRoutable
    ) {
        self.ui = ui
        self.router = router
    }

    func viewDidLoad() {
        loadData()
    }

    private func loadData() {
        #warning("Show spinner")
        
        var allEntities = [Marvel.MarvelEntity]()
        let publishers = generatePublishers()

        Publishers.MergeMany(publishers)
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    switch completion {
                    case .finished:
                        let viewModels = allEntities.map { ListCollectionModel(entity: $0) }
                        self.ui?.show(items: viewModels)
                    case .failure(let error):
                        self.ui?.show(error: error)
                    }
                },
                receiveValue: { entities in
                    allEntities.append(contentsOf: entities)
                }
            )
            .store(in: &cancellables)
    }

    private func generatePublishers() -> [AnyPublisher<[Marvel.MarvelEntity], Error>] {
        if let source = ListSectionMapper().map(selectedCategory),
           selectedCategory != .all {
            return [
                getSearch(generateSearchQuery(type: source, pageSize: .big))
            ]
        } else {
            return [
                getSearch(generateSearchQuery(type: .characters, pageSize: .small)),
                getSearch(generateSearchQuery(type: .comics, pageSize: .small)),
                getSearch(generateSearchQuery(type: .creators, pageSize: .small)),
                getSearch(generateSearchQuery(type: .events, pageSize: .small)),
                getSearch(generateSearchQuery(type: .series, pageSize: .small)),
            ]
        }
    }

    private func generateSearchQuery(type: Marvel.Source, pageSize: SearchQuery.PageSize) -> SearchQuery {
        SearchQuery(
            type: type,
            filter: startsWithFilter,
            pageSize: pageSize
        )
    }

    func didSelect(category: ListSection.Category) {
        selectedCategory = category
        loadData()
    }

    func didChange(filter: String?) {
        startsWithFilter = filter?.trimmingCharacters(in: .whitespaces)
        loadData()
    }

    func didSelectItem(itemId: ItemId) {
        router.openDetail(itemId: itemId)
    }
}
