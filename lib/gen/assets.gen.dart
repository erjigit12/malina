// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/addbasketback.svg
  String get addbasketback => 'assets/icons/addbasketback.svg';

  /// File path: assets/icons/basket.svg
  String get basket => 'assets/icons/basket.svg';

  /// File path: assets/icons/beauty_menu.svg
  String get beautyMenu => 'assets/icons/beauty_menu.svg';

  /// File path: assets/icons/beautysvg.svg
  String get beautysvg => 'assets/icons/beautysvg.svg';

  /// File path: assets/icons/delete.svg
  String get delete => 'assets/icons/delete.svg';

  /// File path: assets/icons/favorites.svg
  String get favorites => 'assets/icons/favorites.svg';

  /// File path: assets/icons/food_menu.svg
  String get foodMenu => 'assets/icons/food_menu.svg';

  /// File path: assets/icons/foodsvg.svg
  String get foodsvg => 'assets/icons/foodsvg.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/plus.svg
  String get plus => 'assets/icons/plus.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/qrcode.svg
  String get qrcode => 'assets/icons/qrcode.svg';

  /// File path: assets/icons/qrcodeshare.svg
  String get qrcodeshare => 'assets/icons/qrcodeshare.svg';

  /// File path: assets/icons/qrhome.svg
  String get qrhome => 'assets/icons/qrhome.svg';

  /// List of all assets
  List<String> get values => [
    addbasketback,
    basket,
    beautyMenu,
    beautysvg,
    delete,
    favorites,
    foodMenu,
    foodsvg,
    home,
    logo,
    plus,
    profile,
    qrcode,
    qrcodeshare,
    qrhome,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/backbasket.png
  AssetGenImage get backbasket =>
      const AssetGenImage('assets/images/backbasket.png');

  /// File path: assets/images/beauty.png
  AssetGenImage get beauty => const AssetGenImage('assets/images/beauty.png');

  /// File path: assets/images/food.png
  AssetGenImage get food => const AssetGenImage('assets/images/food.png');

  /// File path: assets/images/logotype.png
  AssetGenImage get logotype =>
      const AssetGenImage('assets/images/logotype.png');

  /// List of all assets
  List<AssetGenImage> get values => [backbasket, beauty, food, logotype];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
