#if DEBUG

import UIKit
import Core

class TestSceneDelegate: UIResponder, UIWindowSceneDelegate, WindowProvider {

    var window: UIWindow?

    lazy var services: [ServiceProvider] = [
        AdditionsServices(),
        DomainService(path: "http://localhost:6789"),
        AppServiceProvider(windowProvider: self),
        MarvelListServiceProvider()
    ]

    lazy var tasks = AppTasks.build(serviceProviders: services, finished: {
        print("Test tasks finished ✅")
    })

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        tasks.forEach {
            $0.scene?(scene, willConnectTo: session, options: connectionOptions)
        }
    }
}

#endif
