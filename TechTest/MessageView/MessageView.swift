import Foundation
import UIKit

class MessageView: UIView {
    @IBOutlet private var titleLbl: UILabel!
    @IBOutlet private var subtitleLbl: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet var button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .systemBackground
    }

    func configAsType(_ type: MessageViewType) {
        switch type {
        case .errorConnection:
            setupErrorConnection()
        case .errorUnknown:
            setupErrorUnknown()
        }
    }

    // MARK: Config Views

    private func setupErrorConnection() {
        imageView.image = Asset.errorConnectionIcon.image
        titleLbl.text = L10n.messageViewErrorConnectionTitle
        subtitleLbl.text = L10n.messageViewErrorConnectionDescription
        button.setTitle(L10n.retry, for: .normal)
    }

    private func setupErrorUnknown() {
        imageView.image = Asset.errorUnknownIcon.image
        titleLbl.text = L10n.messageViewErrorUnknowTitle
        subtitleLbl.text = L10n.messageViewErrorUnknowDescription
        button.setTitle(L10n.retry, for: .normal)
    }
}
