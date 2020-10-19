import Foundation

internal enum CommonStrings {
    /// Meal Munch
    internal static let appTitle = CommonStrings.tr("Common", "Title.AppName")
    /// An error occured, please try again later
    internal static let errorDescription = CommonStrings.tr("Common", "Error.GenericError")
    /// Loading
    internal static let loading = CommonStrings.tr("Common","Loading")
    /// Try this on Instagram and tag us!
    internal static let tryThis = CommonStrings.tr("Common","TryThis")

    /// Credits
    internal static let credits = CommonStrings.tr("Common","Credits")
    /// Placeholder image: https://icon-library.com/icon/placeholder-image-icon-21.html
    internal static let creditListOne = CommonStrings.tr("Common","creditListOne")
    /// Error screen image: https://www.glazestock.com/image/jBjjMBb9K/free
    internal static let creditListTwo = CommonStrings.tr("Common","creditListTwo")
    ///Loading screen image: https://www.glazestock.com/image/DTBng4Mc6
    internal static let creditListThree = CommonStrings.tr("Common","creditListThree")
    /// Logo and app icon created by myself on www.freelogodesign.org
    internal static let creditListFour = CommonStrings.tr("Common","creditListFour")
    /// Third party API free security passer = https://gist.github.com/DejanEnspyra/80e259e3c9adf5e46632631b49cd1007
    internal static let creditListFive = CommonStrings.tr("Common","creditListFive")
}

extension CommonStrings {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {}
