/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar_default.png
  AssetGenImage get avatarDefault =>
      const AssetGenImage('assets/images/avatar_default.png');

  /// File path: assets/images/big_hotel_image1.png
  AssetGenImage get bigHotelImage1 =>
      const AssetGenImage('assets/images/big_hotel_image1.png');

  /// File path: assets/images/circle-splash.png
  AssetGenImage get circleSplash =>
      const AssetGenImage('assets/images/circle-splash.png');

  /// File path: assets/images/default_map.png
  AssetGenImage get defaultMap =>
      const AssetGenImage('assets/images/default_map.png');

  /// File path: assets/images/hotel.png
  AssetGenImage get hotel => const AssetGenImage('assets/images/hotel.png');

  /// File path: assets/images/hotel1.png
  AssetGenImage get hotel1 => const AssetGenImage('assets/images/hotel1.png');

  /// File path: assets/images/hotel2.png
  AssetGenImage get hotel2 => const AssetGenImage('assets/images/hotel2.png');

  /// File path: assets/images/hotel3.png
  AssetGenImage get hotel3 => const AssetGenImage('assets/images/hotel3.png');

  /// File path: assets/images/hotel_plane.png
  AssetGenImage get hotelPlane =>
      const AssetGenImage('assets/images/hotel_plane.png');

  /// File path: assets/images/intro1.png
  AssetGenImage get intro1 => const AssetGenImage('assets/images/intro1.png');

  /// File path: assets/images/intro2.png
  AssetGenImage get intro2 => const AssetGenImage('assets/images/intro2.png');

  /// File path: assets/images/intro3.png
  AssetGenImage get intro3 => const AssetGenImage('assets/images/intro3.png');

  /// File path: assets/images/oval-appbar.png
  AssetGenImage get ovalAppbar =>
      const AssetGenImage('assets/images/oval-appbar.png');

  /// File path: assets/images/oval-appbar2.png
  AssetGenImage get ovalAppbar2 =>
      const AssetGenImage('assets/images/oval-appbar2.png');

  /// File path: assets/images/plane.png
  AssetGenImage get plane => const AssetGenImage('assets/images/plane.png');

  /// File path: assets/images/room1.png
  AssetGenImage get room1 => const AssetGenImage('assets/images/room1.png');

  /// File path: assets/images/room2.png
  AssetGenImage get room2 => const AssetGenImage('assets/images/room2.png');

  /// File path: assets/images/room3.png
  AssetGenImage get room3 => const AssetGenImage('assets/images/room3.png');

  /// File path: assets/images/splash-bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash-bg.png');

  /// File path: assets/images/yin-yang-symbol.png
  AssetGenImage get yinYangSymbol =>
      const AssetGenImage('assets/images/yin-yang-symbol.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatarDefault,
        bigHotelImage1,
        circleSplash,
        defaultMap,
        hotel,
        hotel1,
        hotel2,
        hotel3,
        hotelPlane,
        intro1,
        intro2,
        intro3,
        ovalAppbar,
        ovalAppbar2,
        plane,
        room1,
        room2,
        room3,
        splashBg,
        yinYangSymbol
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
