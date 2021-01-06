import UIKit
import SDWebImage

class ImageViewCell: UITableViewCell {
    private var sharedAppearance = AppearanceHandler()

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var images: UIImageView!
    @IBOutlet private weak var imagesView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setViewFontsAndColors()
        setUpView()
    }

    func setViewFontsAndColors() {
        descriptionLabel.font = sharedAppearance.descriptionFont(withSize: 11)
    }

    func setUpView() {
        images.image = UIImage(named: "ImagePlaceholder")
        images.layer.cornerRadius = CGFloat(Constants().cornerRadius)
        descriptionLabel.text = CommonStrings.tryThis
    }

    func configure(imageURL: URL) {
        setUpImage(imageURL: imageURL)
    }

    func setUpImage(imageURL: URL) {
        images.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "ImagePlaceholder"))
    }
}
