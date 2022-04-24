import Foundation
import Core
import SwiftUI

// NOTE: Router division is ready to create list and detail modules
protocol ListRouterProtocol {
    func openDetail(itemId: ItemId)
}

extension ListRouterProtocol where Self: Router {
    func openDetail(itemId: ItemId) {
        let service: DetailService = rootService.module()
        let viewController = service.provideDetailViewController(itemId: itemId)
        push(viewController: viewController)
    }
}

typealias ListRoutable = ListRouterProtocol

class ListRouter: Router, ListRoutable {}
