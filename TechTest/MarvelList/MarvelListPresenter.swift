import Foundation
import Combine
import Core

class MarvelListPresenter {
    private weak var ui: MarvelListUI?
    private var cancellables = Set<AnyCancellable>()
    private let getMarvelEntities = GetMarvelEntity()
    private var selectedCategory: Section.Category = .all
    private var startsWithFilter: String?

    init(
        ui: MarvelListUI
    ) {
        self.ui = ui
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
                        let viewModels = allEntities.map { MarvelListCollectionModel(entity: $0) }
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
        if let source = SectionCategoryMapper().map(selectedCategory),
           selectedCategory != .all {
            return [getMarvelEntities(type: source, filter: startsWithFilter)]
        } else {
            return [
                getMarvelEntities(type: .characters, filter: startsWithFilter),
                getMarvelEntities(type: .comics, filter: startsWithFilter),
                getMarvelEntities(type: .creators, filter: startsWithFilter),
                getMarvelEntities(type: .events, filter: startsWithFilter),
                getMarvelEntities(type: .series, filter: startsWithFilter),
            ]
        }
    }

    func didSelect(category: Section.Category) {
        selectedCategory = category
        loadData()
    }

    func didChange(filter: String?) {
        startsWithFilter = filter?.trimmingCharacters(in: .whitespaces)
        loadData()
    }

    func didSelectItem(id: String) {
        #warning("TODO")
    }
}
