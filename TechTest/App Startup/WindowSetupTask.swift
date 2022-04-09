import UIKit
import Core

class WindowSetupTask: AppTask {

    internal init(windowProvider: WindowProvider) {
        self.windowProvider = windowProvider
    }

    var windowProvider: WindowProvider

    @Inject var dispatch: Dispatching

    override func main() {
        super.main()

        dispatch.dispatchMain {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }),
               let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                let vc = UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()

                window.rootViewController = vc
                self.windowProvider.window = window
                window.makeKeyAndVisible()
                self.state = .finished
            }
        }
    }
}
