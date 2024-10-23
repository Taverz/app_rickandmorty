/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_left.svg
  SvgGenImage get arrowLeft => const SvgGenImage('assets/icons/arrow_left.svg');

  /// File path: assets/icons/gender_female.svg
  SvgGenImage get genderFemale =>
      const SvgGenImage('assets/icons/gender_female.svg');

  /// File path: assets/icons/gender_male.svg
  SvgGenImage get genderMale =>
      const SvgGenImage('assets/icons/gender_male.svg');

  /// File path: assets/icons/gender_unknown.svg
  SvgGenImage get genderUnknown =>
      const SvgGenImage('assets/icons/gender_unknown.svg');

  /// File path: assets/icons/information.svg
  SvgGenImage get information =>
      const SvgGenImage('assets/icons/information.svg');

  /// File path: assets/icons/like_liked.svg
  SvgGenImage get likeLiked => const SvgGenImage('assets/icons/like_liked.svg');

  /// File path: assets/icons/like_un_liked.svg
  SvgGenImage get likeUnLiked =>
      const SvgGenImage('assets/icons/like_un_liked.svg');

  /// File path: assets/icons/species_alien.svg
  SvgGenImage get speciesAlien =>
      const SvgGenImage('assets/icons/species_alien.svg');

  /// File path: assets/icons/species_human.svg
  SvgGenImage get speciesHuman =>
      const SvgGenImage('assets/icons/species_human.svg');

  /// File path: assets/icons/status_alive.svg
  SvgGenImage get statusAlive =>
      const SvgGenImage('assets/icons/status_alive.svg');

  /// File path: assets/icons/status_dead.svg
  SvgGenImage get statusDead =>
      const SvgGenImage('assets/icons/status_dead.svg');

  /// File path: assets/icons/status_unknown.svg
  SvgGenImage get statusUnknown =>
      const SvgGenImage('assets/icons/status_unknown.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowLeft,
        genderFemale,
        genderMale,
        genderUnknown,
        information,
        likeLiked,
        likeUnLiked,
        speciesAlien,
        speciesHuman,
        statusAlive,
        statusDead,
        statusUnknown
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
