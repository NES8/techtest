import UIKit
import SDWebImage

protocol DetailUI: BaseUI {
    func show(item: DetailViewModel)
}

class DetailViewController: BaseViewController {

    @IBOutlet private var pictureImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionTextView: UITextView!

    var presenter: DetailPresenter!
    override var lifecyclePresenter: PresenterInterface? {
        return presenter
    }
}

extension DetailViewController: DetailUI {
    func show(item: DetailViewModel) {
        
        nameLabel.text = item.name
        descriptionTextView.text = item.description
        
        pictureImageView.sd_setImage(
            with: item.imageUrl,
            placeholderImage: Asset.noPicture.image
        )
        
        hideAllSubviews()
    }
}
