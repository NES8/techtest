import Foundation
import Core

// NOTE: Router division is ready to create list and detail modules
protocol ListRouterProtocol {
    func openDetail(id: String)
}

extension ListRouterProtocol where Self: Router {
    func openDetail(id: String) {
        let service: DetailService = rootService.module()
        let viewController = service.provideDetailViewController(id: id)
        push(viewController: viewController)
    }
}

typealias ListRoutable = ListRouterProtocol

class ListRouter: Router, ListRoutable {}
