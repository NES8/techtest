import UIKit

class LoadingView: UIView {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemBackground
        activityIndicator.startAnimating()
        titleLabel.text = L10n.loading
    }
}
