import UIKit

class ImageViewCell: UITableViewCell {
    private var sharedAppearance = AppearanceHandler()

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var images: UIImageView!
    @IBOutlet private weak var imagesView: UIView!
    @IBOutlet private weak var pageController: UIPageControl!

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
        pageController.tintColor = sharedAppearance.secondaryColour
    }
}
