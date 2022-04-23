import Foundation
import SwiftUI

public protocol ListService {
    func provideListViewController() -> UIViewController
}

struct ListServiceLocator: ListService {

    func provideListViewController() -> UIViewController {
        let viewController = UIStoryboard(name: "List").instantiateRootViewController() as ListViewController
        viewController.presenter = ListPresenter(
            ui: viewController
        )
        return UINavigationController(rootViewController: viewController)
    }
}
