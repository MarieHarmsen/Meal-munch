import UIKit

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
        images.layer.cornerRadius = 15
        descriptionLabel.text = CommonStrings.tryThis
    }

    func configure(imageURL: URL) {
        images.image = downloadImage(imageURL: imageURL)
    }

    func downloadImage(imageURL: URL) -> UIImage? {
        let data = try? Data(contentsOf: imageURL)
        if let imageData = data {
            return UIImage(data: imageData)
        }
        return UIImage(named: "ImagePlaceholder")
    }
}
