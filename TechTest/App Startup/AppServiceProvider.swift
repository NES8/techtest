import Foundation

class AppServiceProvider: ServiceProvider {
    internal init(windowProvider: WindowProvider) {
        self.windowProvider = windowProvider
    }

    var windowProvider: WindowProvider

    lazy var appTasks: [AppTask] = {
        [
            WindowSetupTask(windowProvider: windowProvider),
            AppUITask(windowProvider: windowProvider),
        ]
    }()

    func modules() -> [Register] {
        []
    }
}
