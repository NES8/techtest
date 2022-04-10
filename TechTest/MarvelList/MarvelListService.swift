import Foundation
import SwiftUI

public protocol MarvelListService {
    func provideMarvelListViewController() -> UIViewController
}

struct MarvelListServiceLocator: MarvelListService {

    func provideMarvelListViewController() -> UIViewController {
        let vc = UIStoryboard(name: "MarvelList").instantiateRootViewController() as MarvelListViewController
        vc.presenter = MarvelListPresenter(
            ui: vc
        )
        return vc
    }
}
