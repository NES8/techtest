import UIKit

public extension UIStoryboard {

    convenience init(name: String) {
        self.init(name: name, bundle: Bundle.main)
    }

    func instantiate<T>(identifier: String, asClass className: T.Type) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }

    func instantiate<T>(identifier: String) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }

    func instantiateRootViewController<T>() -> T {
        return (instantiateInitialViewController() ?? instantiateViewController(withIdentifier: "Root VC")) as! T
    }
}
