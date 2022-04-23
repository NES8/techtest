import Foundation
import UIKit
import Core

protocol WindowProvider {
    var window: UIWindow? { get set }
}

class AppUITask: NoOpAppTask {
    internal init(windowProvider: WindowProvider) {
        self.windowProvider = windowProvider
    }

    var windowProvider: WindowProvider
    @Inject private var listService: ListService

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        windowProvider.window?.rootViewController = listService.provideListViewController()
    }
}
