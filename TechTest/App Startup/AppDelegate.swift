import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
#if DEBUG
        // Remove any cached scene configurations to ensure that TestingAppDelegate.application(_:configurationForConnecting:options:) is called and TestingSceneDelegate will be used when running unit tests. NOTE: THIS IS PRIVATE API AND MAY BREAK IN THE FUTURE!
        for sceneSession in application.openSessions {
            application.perform(Selector(("_removeSessionFromSessionSet:")), with: sceneSession)
        }
#endif
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
#if DEBUG
        let isRunningUITests = ProcessInfo.processInfo.arguments.contains("--uitest")
        let isRunningUnitTests = NSClassFromString("XCTestCase") != nil
        guard isRunningUITests || isRunningUnitTests else {
            return UISceneConfiguration(name: "\(SceneDelegate.self)", sessionRole: .windowApplication)
        }

        let config =  UISceneConfiguration(name: "\(TestSceneDelegate.self)", sessionRole: .windowApplication)
        config.delegateClass = TestSceneDelegate.self
        return config
#else
        return UISceneConfiguration(name: "\(SceneDelegate.self)", sessionRole: .windowApplication)
#endif
    }
}
