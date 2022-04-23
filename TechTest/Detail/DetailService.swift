import Foundation
import SwiftUI

public protocol DetailService {
    func provideDetailViewController(id: String) -> UIViewController
}

struct DetailServiceLocator: DetailService {

    func provideDetailViewController(id: String) -> UIViewController {
        let viewController = UIStoryboard(name: "Detail").instantiateRootViewController() as DetailViewController
        viewController.presenter = DetailPresenter(
            id: id,
            ui: viewController
        )
        return viewController
    }
}
