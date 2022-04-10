import UIKit
import SDWebImage

class MarvelListCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var pictureImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

//        titleLabel.styleHeadline2()
//        bodyLabel.styleTitle2()
    }

    func setup(_ viewModel: MarvelListCollectionModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description

        pictureImageView.sd_setImage(with: viewModel.pictureURL,
                                     placeholderImage: Asset.noPicture.image)
    }
}
