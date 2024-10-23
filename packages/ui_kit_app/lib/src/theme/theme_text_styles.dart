import 'package:flutter/material.dart';
import 'package:ui_kit_app/src/theme/theme.dart';

TextTheme createTextTheme() {
  return const TextTheme(
    displayLarge: TextStyleApp.subtitleBold,
    displayMedium: TextStyleApp.bodyMedium,
    displaySmall: TextStyleApp.captionMedium,
  );
}

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  ThemeTextStyles({
    required this.subtitleBold,
    required this.bodyBold,
    required this.bodyMedium,
    required this.captionBold,
    required this.captionMedium,
  });

  final TextStyle subtitleBold;
  final TextStyle bodyBold;
  final TextStyle bodyMedium;
  final TextStyle captionBold;
  final TextStyle captionMedium;

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? subtitleBold,
    TextStyle? bodyBold,
    TextStyle? bodyMedium,
    TextStyle? captionBold,
    TextStyle? captionMedium,
  }) {
    return ThemeTextStyles(
      subtitleBold: subtitleBold ?? this.subtitleBold,
      bodyBold: bodyBold ?? this.bodyBold,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      captionBold: captionBold ?? this.captionBold,
      captionMedium: captionMedium ?? this.captionMedium,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
    ThemeExtension<ThemeTextStyles>? other,
    double t,
  ) {
    if (other is! ThemeTextStyles) {
      return this;
    }

    return ThemeTextStyles(
      subtitleBold: TextStyle.lerp(subtitleBold, other.subtitleBold, t)!,
      bodyBold: TextStyle.lerp(bodyBold, other.bodyBold, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
    );
  }

  static ThemeTextStyles get dark => ThemeTextStyles(
        subtitleBold: TextStyleApp.subtitleBold,
        bodyBold: TextStyleApp.bodyBold,
        bodyMedium: TextStyleApp.bodyMedium,
        captionBold: TextStyleApp.captionBold,
        captionMedium: TextStyleApp.captionMedium,
      );

  static ThemeTextStyles get whiteTheme => ThemeTextStyles(
        subtitleBold: TextStyleApp.subtitleBold.copyWith(
          color: AppColors.nero,
        ),
        bodyBold: TextStyleApp.bodyBold.copyWith(
          color: AppColors.nero,
        ),
        bodyMedium: TextStyleApp.bodyMedium.copyWith(
          color: AppColors.nero,
        ),
        captionBold: TextStyleApp.captionBold.copyWith(
          color: AppColors.nero,
        ),
        captionMedium: TextStyleApp.captionMedium.copyWith(
          color: AppColors.nero,
        ),
      );
}
