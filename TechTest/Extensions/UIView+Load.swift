import UIKit

extension UIView {
    class func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }

    class func loadFromNib() -> UIView? {
        let name = String(describing: self)
        return UINib(
            nibName: name,
            bundle: Bundle.main
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}
