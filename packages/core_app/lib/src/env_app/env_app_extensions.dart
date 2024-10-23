// import 'package:flutter/material.dart';

// import 'env_app_state.dart';

part  of 'env_app.dart';


/// Localization extension. Currently we use only ru local
extension AppLocaleEnumExt on LocaleEnum {
  /// Get current localization
  Locale get get {
    return const Locale('en');
    // switch (this) {
    //   case LocaleEnum.en:
    //     return const Locale('en');
    //   case LocaleEnum.ru:
    //     return const Locale('ru');
    // }
  }

  /// Return name of current localization
  String asString() {
    switch (this) {
      case LocaleEnum.en:
        return 'en';
      case LocaleEnum.ru:
        return 'ru';
    }
  }
}

/// Dark theme name
const String darkConst = 'dark';

/// Light theme name
const String lightConst = 'light';

/// System theme name
const String systemConst = 'system';

/// Theme extension
extension ThemeModeExt on ThemeMode {
  /// Get theme as string
  String asString() {
    switch (this) {
      case ThemeMode.dark:
        return darkConst;
      case ThemeMode.light:
        return lightConst;
      case ThemeMode.system:
        return systemConst;
    }
  }
}

/// Locale extension
extension StringExt on String {
  /// Get current locale
  LocaleEnum get getLocale {
    switch (this) {
      case 'en':
        return LocaleEnum.en;
      case 'ru':
        return LocaleEnum.ru;
      default:
        return LocaleEnum.ru;
    }
  }

  /// Get theme mode
  ThemeMode get getThemeMode {
    switch (this) {
      case darkConst:
        return ThemeMode.dark;
      case lightConst:
        return ThemeMode.light;
      case systemConst:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }
}
