import 'package:flutter/material.dart';

class TextStyleApp {
  static const String fontFamily = 'Lato';

  static const TextStyle subtitleBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle captionBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle captionMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
}

enum TypographyStyle {
  subtitleBold,
  bodyBold,
  bodyMedium,
  captionBold,
  captionMedium,
}

class AppTypography {
  static const String fontFamily = 'Lato';

  static TextStyle getStyle(TypographyStyle style) {
    switch (style) {
      case TypographyStyle.subtitleBold:
        return TextStyleApp.subtitleBold;
      case TypographyStyle.bodyBold:
        return TextStyleApp.bodyBold;
      case TypographyStyle.bodyMedium:
        return TextStyleApp.bodyMedium;
      case TypographyStyle.captionBold:
        return TextStyleApp.captionBold;
      case TypographyStyle.captionMedium:
        return TextStyleApp.captionMedium;
    }
  }
}
