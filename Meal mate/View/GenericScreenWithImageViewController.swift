import UIKit

class GenericScreenWithImageViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    private let sharedAppearance = AppearanceHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configure(imageName: String, description: String) {
        imageView.image = UIImage(named: "ErrorImage")
        descriptionLabel.text = description
        descriptionLabel.font = sharedAppearance.descriptionFont(withSize: 11)
    }
}
