import Foundation
import UIKit

public extension UIDevice {
    static func isIpad() -> Bool {
        return current.userInterfaceIdiom == .pad
    }

    static func isInPortrait() -> Bool {
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.windowScene?.interfaceOrientation.isPortrait ?? false
    }
}
