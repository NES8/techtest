import UIKit
import SDWebImage

class ListCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var pictureImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    private let padding: CGFloat = 8
    private lazy var card: UIView = {
        let backgroundCard = UIView(frame: .init(origin: .init(x: padding, y: padding),
                                                 size: .init(width: bounds.width - padding * 2, height: bounds.height - padding * 2)))
        backgroundCard.backgroundColor = .secondarySystemBackground
        backgroundCard.layer.cornerRadius = padding * 2
        backgroundCard.layer.masksToBounds = true
        insertSubview(backgroundCard, at: 0)
        return backgroundCard
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

        pictureImageView.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        card.isHidden = false

        pictureImageView.layer.cornerRadius = padding
    }
    
    func setup(_ viewModel: ListCollectionModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        
        pictureImageView.sd_setImage(
            with: viewModel.pictureURL,
            placeholderImage: Asset.noPicture.image
        )
        
        titleLabel.accessibilityIdentifier = A21r.List.Cell.content(title: viewModel.title).rawValue
    }
}
