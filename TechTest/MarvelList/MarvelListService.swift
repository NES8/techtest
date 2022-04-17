import Foundation
import SwiftUI

public protocol MarvelListService {
    func provideMarvelListViewController() -> UIViewController
}

struct MarvelListServiceLocator: MarvelListService {

    func provideMarvelListViewController() -> UIViewController {
        let viewController = UIStoryboard(name: "MarvelList").instantiateRootViewController() as MarvelListViewController
        viewController.presenter = MarvelListPresenter(
            ui: viewController
        )
        return UINavigationController(rootViewController: viewController)
    }
}
