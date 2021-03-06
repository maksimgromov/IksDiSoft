//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  /// This `R.color` struct is generated, and contains static references to 10 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `blackOpacity16_000000`.
    static let blackOpacity16_000000 = Rswift.ColorResource(bundle: R.hostingBundle, name: "blackOpacity16_000000")
    /// Color `black_000000`.
    static let black_000000 = Rswift.ColorResource(bundle: R.hostingBundle, name: "black_000000")
    /// Color `clear_000000`.
    static let clear_000000 = Rswift.ColorResource(bundle: R.hostingBundle, name: "clear_000000")
    /// Color `dodgerBlue_309CF4`.
    static let dodgerBlue_309CF4 = Rswift.ColorResource(bundle: R.hostingBundle, name: "dodgerBlue_309CF4")
    /// Color `frenchGray_C8C7CC`.
    static let frenchGray_C8C7CC = Rswift.ColorResource(bundle: R.hostingBundle, name: "frenchGray_C8C7CC")
    /// Color `manatee_888A94`.
    static let manatee_888A94 = Rswift.ColorResource(bundle: R.hostingBundle, name: "manatee_888A94")
    /// Color `mineshaft_333333`.
    static let mineshaft_333333 = Rswift.ColorResource(bundle: R.hostingBundle, name: "mineshaft_333333")
    /// Color `titanWhite_E7ECFF`.
    static let titanWhite_E7ECFF = Rswift.ColorResource(bundle: R.hostingBundle, name: "titanWhite_E7ECFF")
    /// Color `white_FFFFFF`.
    static let white_FFFFFF = Rswift.ColorResource(bundle: R.hostingBundle, name: "white_FFFFFF")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "blackOpacity16_000000", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func blackOpacity16_000000(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.blackOpacity16_000000, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "black_000000", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func black_000000(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.black_000000, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "clear_000000", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func clear_000000(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.clear_000000, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "dodgerBlue_309CF4", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func dodgerBlue_309CF4(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.dodgerBlue_309CF4, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "frenchGray_C8C7CC", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func frenchGray_C8C7CC(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.frenchGray_C8C7CC, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "manatee_888A94", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func manatee_888A94(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.manatee_888A94, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "mineshaft_333333", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mineshaft_333333(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mineshaft_333333, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "titanWhite_E7ECFF", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func titanWhite_E7ECFF(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.titanWhite_E7ECFF, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "white_FFFFFF", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func white_FFFFFF(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.white_FFFFFF, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "blackOpacity16_000000", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func blackOpacity16_000000(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.blackOpacity16_000000.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "black_000000", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func black_000000(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.black_000000.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "clear_000000", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func clear_000000(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.clear_000000.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "dodgerBlue_309CF4", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func dodgerBlue_309CF4(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.dodgerBlue_309CF4.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "frenchGray_C8C7CC", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func frenchGray_C8C7CC(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.frenchGray_C8C7CC.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "manatee_888A94", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func manatee_888A94(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.manatee_888A94.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "mineshaft_333333", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func mineshaft_333333(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.mineshaft_333333.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "titanWhite_E7ECFF", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func titanWhite_E7ECFF(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.titanWhite_E7ECFF.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "white_FFFFFF", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func white_FFFFFF(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.white_FFFFFF.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `SegoeUI-Regular.ttf`.
    static let segoeUIRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SegoeUI-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "SegoeUI-Regular", withExtension: "ttf")`
    static func segoeUIRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.segoeUIRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 1 fonts.
  struct font: Rswift.Validatable {
    /// Font `SegoeUI-Regular`.
    static let segoeUIRegular = Rswift.FontResource(fontName: "SegoeUI-Regular")

    /// `UIFont(name: "SegoeUI-Regular", size: ...)`
    static func segoeUIRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: segoeUIRegular, size: size)
    }

    static func validate() throws {
      if R.font.segoeUIRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SegoeUI-Regular' could not be loaded, is 'SegoeUI-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    /// This `R.image.tabBar` struct is generated, and contains static references to 2 images.
    struct tabBar {
      /// Image `main`.
      static let main = Rswift.ImageResource(bundle: R.hostingBundle, name: "TabBar/main")
      /// Image `second`.
      static let second = Rswift.ImageResource(bundle: R.hostingBundle, name: "TabBar/second")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "main", bundle: ..., traitCollection: ...)`
      static func main(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.tabBar.main, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "second", bundle: ..., traitCollection: ...)`
      static func second(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.tabBar.second, compatibleWith: traitCollection)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    /// Nib `LaunchScreen`.
    static let launchScreen = _R.nib._LaunchScreen()
    /// Nib `MainScreenUITableViewCell`.
    static let mainScreenUITableViewCell = _R.nib._MainScreenUITableViewCell()
    /// Nib `MainScreenViewController`.
    static let mainScreenViewController = _R.nib._MainScreenViewController()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "LaunchScreen", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.launchScreen) instead")
    static func launchScreen(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "MainScreenUITableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.mainScreenUITableViewCell) instead")
    static func mainScreenUITableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.mainScreenUITableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "MainScreenViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.mainScreenViewController) instead")
    static func mainScreenViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.mainScreenViewController)
    }
    #endif

    static func launchScreen(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.launchScreen.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func mainScreenUITableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> MainScreenUITableViewCell? {
      return R.nib.mainScreenUITableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MainScreenUITableViewCell
    }

    static func mainScreenViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.mainScreenViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `MainScreenUITableViewCell`.
    static let mainScreenUITableViewCell: Rswift.ReuseIdentifier<MainScreenUITableViewCell> = Rswift.ReuseIdentifier(identifier: "MainScreenUITableViewCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    /// This `R.string.infoPlist` struct is generated, and contains static references to 3 localization keys.
    struct infoPlist {
      /// en translation: XDSoft
      ///
      /// Locales: en, ru
      static let cfBundleDisplayName = Rswift.StringResource(key: "CFBundleDisplayName", tableName: "InfoPlist", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: XDSoft
      ///
      /// Locales: en, ru
      static let cfBundleName = Rswift.StringResource(key: "CFBundleName", tableName: "InfoPlist", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: com.maksimgromov.IksDiSoft
      ///
      /// Locales: en, ru
      static let cfBundleIdentifier = Rswift.StringResource(key: "CFBundleIdentifier", tableName: "InfoPlist", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)

      /// en translation: XDSoft
      ///
      /// Locales: en, ru
      static func cfBundleDisplayName(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("CFBundleDisplayName", tableName: "InfoPlist", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "InfoPlist", preferredLanguages: preferredLanguages) else {
          return "CFBundleDisplayName"
        }

        return NSLocalizedString("CFBundleDisplayName", tableName: "InfoPlist", bundle: bundle, comment: "")
      }

      /// en translation: XDSoft
      ///
      /// Locales: en, ru
      static func cfBundleName(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("CFBundleName", tableName: "InfoPlist", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "InfoPlist", preferredLanguages: preferredLanguages) else {
          return "CFBundleName"
        }

        return NSLocalizedString("CFBundleName", tableName: "InfoPlist", bundle: bundle, comment: "")
      }

      /// en translation: com.maksimgromov.IksDiSoft
      ///
      /// Locales: en, ru
      static func cfBundleIdentifier(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("CFBundleIdentifier", tableName: "InfoPlist", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "InfoPlist", preferredLanguages: preferredLanguages) else {
          return "CFBundleIdentifier"
        }

        return NSLocalizedString("CFBundleIdentifier", tableName: "InfoPlist", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.localizable` struct is generated, and contains static references to 4 localization keys.
    struct localizable {
      /// en translation: Fibonacci Numbers
      ///
      /// Locales: en, ru
      static let mainScreenFibonacciNaumbersLabelText = Rswift.StringResource(key: "MainScreenFibonacciNaumbersLabelText", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Fibonacci Numbers
      ///
      /// Locales: en, ru
      static let tabBarSecondText = Rswift.StringResource(key: "TabBarSecondText", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Prime Numbers
      ///
      /// Locales: en, ru
      static let mainScreenNumbersLabelText = Rswift.StringResource(key: "MainScreenNumbersLabelText", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)
      /// en translation: Prime Numbers
      ///
      /// Locales: en, ru
      static let tabBarMainText = Rswift.StringResource(key: "TabBarMainText", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ru"], comment: nil)

      /// en translation: Fibonacci Numbers
      ///
      /// Locales: en, ru
      static func mainScreenFibonacciNaumbersLabelText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("MainScreenFibonacciNaumbersLabelText", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "MainScreenFibonacciNaumbersLabelText"
        }

        return NSLocalizedString("MainScreenFibonacciNaumbersLabelText", bundle: bundle, comment: "")
      }

      /// en translation: Fibonacci Numbers
      ///
      /// Locales: en, ru
      static func tabBarSecondText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("TabBarSecondText", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "TabBarSecondText"
        }

        return NSLocalizedString("TabBarSecondText", bundle: bundle, comment: "")
      }

      /// en translation: Prime Numbers
      ///
      /// Locales: en, ru
      static func mainScreenNumbersLabelText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("MainScreenNumbersLabelText", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "MainScreenNumbersLabelText"
        }

        return NSLocalizedString("MainScreenNumbersLabelText", bundle: bundle, comment: "")
      }

      /// en translation: Prime Numbers
      ///
      /// Locales: en, ru
      static func tabBarMainText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("TabBarMainText", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "TabBarMainText"
        }

        return NSLocalizedString("TabBarMainText", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _LaunchScreen.validate()
    }

    struct _LaunchScreen: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "pencil.slash") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'pencil.slash' is used in nib 'LaunchScreen', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "dodgerBlue_309CF4", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'dodgerBlue_309CF4' is used in nib 'LaunchScreen', but couldn't be loaded.") }
          if UIKit.UIColor(named: "white_FFFFFF", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'white_FFFFFF' is used in nib 'LaunchScreen', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }

    struct _MainScreenUITableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = MainScreenUITableViewCell

      let bundle = R.hostingBundle
      let identifier = "MainScreenUITableViewCell"
      let name = "MainScreenUITableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> MainScreenUITableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MainScreenUITableViewCell
      }

      fileprivate init() {}
    }

    struct _MainScreenViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "MainScreenViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
