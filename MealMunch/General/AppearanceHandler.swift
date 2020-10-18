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
        return UIColor(red: 24, green: 24, blue: 24, alpha: 1)
    }

    var whiteColour: UIColor {
        return UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    }

    var headingText: UIFont {
        return UIFont(name: "Noteworthy", size: 20) ?? UIFont()
    }

    var mainColour: UIColor {
        return UIColor(red: 168, green: 219, blue: 168, alpha: 1)
    }

    var secondaryColour: UIColor {
        return UIColor(red: 121, green: 189, blue: 154, alpha: 1)
    }
}
