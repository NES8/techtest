import UIKit
import Core

class SceneDelegate: UIResponder, UIWindowSceneDelegate, WindowProvider {

    var window: UIWindow?

    lazy var services: [ServiceProvider] = [
        AdditionsServices(),
        DomainService(),
        AppServiceProvider(windowProvider: self),
        ListServiceProvider()
    ]

    lazy var tasks = AppTasks.build(serviceProviders: services, finished: {
        print("tasks finished ✅")
    })

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        tasks.forEach {
            $0.scene?(scene, willConnectTo: session, options: connectionOptions)
        }
    }
}
