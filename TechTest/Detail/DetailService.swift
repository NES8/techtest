import Foundation
import UIKit
import Core

public protocol DetailService {
    func provideDetailViewController(itemId: ItemId) -> UIViewController
}

struct DetailServiceLocator: DetailService {

    func provideDetailViewController(itemId: ItemId) -> UIViewController {
        let viewController = UIStoryboard(name: "Detail").instantiateRootViewController() as DetailViewController
        viewController.presenter = DetailPresenter(
            itemId: itemId,
            ui: viewController
        )
        return viewController
    }
}
