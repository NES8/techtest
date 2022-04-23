import Foundation
import SwiftUI

public protocol ListService {
    func provideListViewController() -> UIViewController
}

struct ListServiceLocator: ListService {

    func provideListViewController() -> UIViewController {
        let viewController = UIStoryboard(name: "List").instantiateRootViewController() as ListViewController
        let router = ListRouter(rootViewController: viewController)

        viewController.presenter = ListPresenter(
            ui: viewController,
            router: router
        )
        return UINavigationController(rootViewController: viewController)
    }
}
