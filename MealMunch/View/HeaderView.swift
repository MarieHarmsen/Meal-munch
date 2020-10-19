import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    private var sharedAppearance = AppearanceHandler()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setViewFontsAndColors()
        self.contentView.backgroundColor = sharedAppearance.whiteColour
    }

    func setViewFontsAndColors() {
        titleLabel.font = sharedAppearance.headingBoldFont(withSize: 18)
        subTitleLabel.font = sharedAppearance.subTitleFont(withSize: 13)
    }

    func configure(title: String?, subTitle: String?) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}
