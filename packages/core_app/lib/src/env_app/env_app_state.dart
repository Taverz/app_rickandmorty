import 'package:flutter/material.dart';

enum LocaleEnum { ru, en }

class EnvState {
  final ThemeMode themeMode;
  final LocaleEnum locale;

  /// Constructor with default values
  const EnvState({
    this.themeMode = ThemeMode.light,
    this.locale = LocaleEnum.ru,
  });

  EnvState copyWith({
    ThemeMode? themeMode,
    LocaleEnum? locale,
  }) {
    return EnvState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  String toString() => 'EnvState(themeMode: $themeMode, locale: $locale)';

  @override
  bool operator ==(covariant EnvState other) {
    if (identical(this, other)) return true;

    return other.themeMode == themeMode && other.locale == locale;
  }

  @override
  int get hashCode => themeMode.hashCode ^ locale.hashCode;
}
