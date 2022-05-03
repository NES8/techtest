import UIKit
import Core

public typealias DismissCompletion = () -> Void

public protocol Routing {
    func close()
    func pop()
    func dismiss(completion: DismissCompletion?)
}

open class Router: Routing {

    private weak var rootViewController: UIViewController?

    public init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    public var rootService: CoreServiceLocator {
        CoreServiceLocator.shared
    }

    public func push(viewController: UIViewController, animated: Bool = true) {
        guard let rootViewController = rootViewController else { return }
        rootViewController.show(viewController, sender: self)
    }

    public func pop() {
        let topController = rootViewController?.topMostViewController()
        topController?.navigationController?.popViewController(animated: true)
    }

    public func present(viewController: UIViewController, animated: Bool = true, completion: DismissCompletion? = nil) {
        guard let rootViewController = rootViewController else { return }
        rootViewController.present(viewController, animated: animated, completion: nil)
    }

    open func dismiss(completion: DismissCompletion?) {
        rootViewController?.dismiss(animated: true, completion: completion)
    }

    public func close() {
        if let rootViewController = rootViewController,
           rootViewController.presentingViewController != nil {
            rootViewController.dismiss(animated: true, completion: .none)
        } else {
            let topController = rootViewController?.topMostViewController()
            topController?.navigationController?.popViewController(animated: true)
        }
    }
}
