import Foundation

internal enum CommonStrings {
  /// Meal Munch
  internal static let AppTitle = CommonStrings.tr("Common", "Title.AppName")
  /// An error occured, please try again later
  internal static let errorDescription = CommonStrings.tr("Common", "Error.GenericError")
}

extension CommonStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
