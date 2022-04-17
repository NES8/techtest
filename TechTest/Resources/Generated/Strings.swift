// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Filter
  internal static let listFilterMenuTitle = L10n.tr("Localizable", "List FilterMenu Title")
  /// Name starts with...
  internal static let listSearchPlaceholder = L10n.tr("Localizable", "List Search Placeholder")
  /// All
  internal static let listSectionTitleAll = L10n.tr("Localizable", "List SectionTitle all")
  /// Characters
  internal static let listSectionTitleCharacters = L10n.tr("Localizable", "List SectionTitle characters")
  /// Comics
  internal static let listSectionTitleComics = L10n.tr("Localizable", "List SectionTitle comics")
  /// Creators
  internal static let listSectionTitleCreators = L10n.tr("Localizable", "List SectionTitle creators")
  /// Events
  internal static let listSectionTitleEvents = L10n.tr("Localizable", "List SectionTitle events")
  /// Series
  internal static let listSectionTitleSeries = L10n.tr("Localizable", "List SectionTitle series")
  /// Marvel Universe
  internal static let listTitle = L10n.tr("Localizable", "List Title")
  /// Loading
  internal static let loading = L10n.tr("Localizable", "Loading")
  /// OK
  internal static let messageViewDefaultAnswerButtonTitle = L10n.tr("Localizable", "MessageView DefaultAnswer ButtonTitle")
  /// Please, change filters
  internal static let messageViewEmptyCaseDescription = L10n.tr("Localizable", "MessageView EmptyCase Description")
  /// No results
  internal static let messageViewEmptyCaseTitle = L10n.tr("Localizable", "MessageView EmptyCase Title")
  /// Please, check your internet connection and try again
  internal static let messageViewErrorConnectionDescription = L10n.tr("Localizable", "MessageView ErrorConnection Description")
  /// Connection error
  internal static let messageViewErrorConnectionTitle = L10n.tr("Localizable", "MessageView ErrorConnection Title")
  /// Please take a while and try again
  internal static let messageViewErrorUnknowDescription = L10n.tr("Localizable", "MessageView ErrorUnknow Description")
  /// Unknow error
  internal static let messageViewErrorUnknowTitle = L10n.tr("Localizable", "MessageView ErrorUnknow Title")
  /// Retry
  internal static let retry = L10n.tr("Localizable", "Retry")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
