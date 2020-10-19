import UIKit

class CreditViewController: UIViewController {

    @IBOutlet private weak var creditOne: UILabel!
    @IBOutlet private weak var creditTwo: UILabel!
    @IBOutlet private weak var creditThree: UILabel!
    @IBOutlet private weak var creditFour: UILabel!
    @IBOutlet private weak var creditFive: UILabel!

    private let sharedAppearance = AppearanceHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        setUpView()
    }

    public func setUpView() {
        creditOne.text = CommonStrings.creditListOne
        creditTwo.text = CommonStrings.creditListTwo
        creditThree.text = CommonStrings.creditListThree
        creditFour.text = CommonStrings.creditListFour
        creditFive.text = CommonStrings.creditListFive

        creditOne.font = sharedAppearance.descriptionFont(withSize: 11)
        creditTwo.font = sharedAppearance.descriptionFont(withSize: 11)
        creditThree.font = sharedAppearance.descriptionFont(withSize: 11)
        creditFour.font = sharedAppearance.descriptionFont(withSize: 11)
        creditFive.font = sharedAppearance.descriptionFont(withSize: 11)
    }
}
