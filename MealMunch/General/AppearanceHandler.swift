import Foundation
import UIKit

struct AppearanceHandler {
    func headingBoldFont(withSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
    }

    func subTitleFont(withSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
    }

    func descriptionFont(withSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.thin)
    }

    var subTitleColour: UIColor {
        return UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1.0)
    }

    var whiteColour: UIColor {
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }

    var headingText: UIFont {
        return UIFont(name: "Noteworthy", size: 20) ?? UIFont()
    }

    var mainColour: UIColor {
        return UIColor(red: 168/255, green: 219/255, blue: 168/255, alpha: 1.0)
    }

    var secondaryColour: UIColor {
        return UIColor(red: 121/255, green: 189/255, blue: 154/255, alpha: 1.0)
    }
}
