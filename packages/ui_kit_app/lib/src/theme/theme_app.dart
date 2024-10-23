import 'package:flutter/material.dart';
import 'package:ui_kit_app/src/theme/colors_pallet.dart';
import 'package:ui_kit_app/src/theme/theme_text_styles.dart';

/// Color and text extension
extension ContextExt on BuildContext {
  /// Get text styles
  ThemeTextStyles get text => Theme.of(this).extension<ThemeTextStyles>()!;

  /// Get colors
  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;
}

/// White
ThemeData createWhiteTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.whiteSmoke,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.whiteTheme,
      ThemeTextStyles.whiteTheme,
    ],
    appBarTheme: AppBarTheme(
      color: AppColors.whiteSmoke,
    ),
    iconTheme: IconThemeData(
      color: AppColors.nero,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.nero,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.whiteSmoke,
    ),
    textTheme: createTextTheme(),
  );
}

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.whiteSmoke,
    required this.whiteApp,
    required this.irisBlue,
    required this.nero,
    required this.grey,
  });

  final Color whiteSmoke;
  final Color whiteApp;
  final Color irisBlue;
  final Color nero;
  final Color grey;

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? whiteSmoke,
    Color? whiteApp,
    Color? irisBlue,
    Color? nero,
    Color? grey,
  }) {
    return ThemeColors(
      whiteSmoke: whiteSmoke ?? this.whiteSmoke,
      whiteApp: whiteApp ?? this.whiteApp,
      irisBlue: irisBlue ?? this.irisBlue,
      nero: nero ?? this.nero,
      grey: grey ?? this.grey,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      whiteSmoke: Color.lerp(whiteSmoke, other.whiteSmoke, t)!,
      whiteApp: Color.lerp(whiteApp, other.whiteApp, t)!,
      irisBlue: Color.lerp(irisBlue, other.irisBlue, t)!,
      nero: Color.lerp(nero, other.nero, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
    );
  }

  static ThemeColors get whiteTheme => ThemeColors(
        whiteSmoke: AppColors.whiteSmoke,
        whiteApp: AppColors.white,
        irisBlue: AppColors.irisBlue,
        nero: AppColors.nero,
        grey: AppColors.grey,
      );
}
