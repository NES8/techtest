import UIKit

enum MessageViewType {
    case errorConnection
    case errorUnknown
}

class MessageViewProvider: NSObject {
    static func provide(type: MessageViewType, frame: CGRect) -> MessageView {
        let view = UIView.loadFromNibNamed("MessageView") as! MessageView
        view.frame = frame
        view.configAsType(type)
        return view
    }
}
