import UIKit

class SearchCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var searchField: UITextField!

    private var sharedAppearance = AppearanceHandler()
    private var viewDelegate: SearchViewDelegate?

    func configure(viewDelegate: SearchViewDelegate) {
        self.viewDelegate = viewDelegate
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
        searchField.delegate = self
        searchField.becomeFirstResponder()
    }

    func setUpViews() {
        actionButton.setTitle(CommonStrings.search, for: .normal)
        actionButton.titleLabel?.font = sharedAppearance.subTitleFont(withSize: 14)
        actionButton.titleLabel?.tintColor = sharedAppearance.secondaryColour
        descriptionLabel.text = CommonStrings.searchDescription
        descriptionLabel.font = sharedAppearance.descriptionFont(withSize: 11)
        contentView.layer.cornerRadius = 0
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    @IBAction func didSearch(_ sender: Any) {
        viewDelegate?.didTapSearch(query: searchField.text ?? "")
    }
}
