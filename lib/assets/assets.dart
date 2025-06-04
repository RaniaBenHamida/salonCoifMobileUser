import 'package:flutter/material.dart';

class Assets {
  Assets._();
  static const $Icons icons = $Icons();
  static const $Logo logo = $Logo();
}

class AssetGen {
  const AssetGen(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class $Icons {
  const $Icons();
  String get demography => 'assets/icons/demography.svg';
  String get empty => 'assets/icons/empty.svg';
  String get emptyUanimation => 'assets/icons/empty_animation.json';
  String get home => 'assets/icons/home.svg';
  String get kyc => 'assets/icons/kyc.svg';
  String get location => 'assets/icons/location.svg';
  AssetGen get locationUpermission => const AssetGen('assets/icons/location_permission.png');
  AssetGen get people => const AssetGen('assets/icons/people.png');
  String get profile => 'assets/icons/profile.svg';
  String get profileUbg => 'assets/icons/profile_bg.jpg';
  String get reject => 'assets/icons/reject.svg';
  String get schedule => 'assets/icons/schedule.svg';
  String get send => 'assets/icons/send.svg';
  String get success => 'assets/icons/success.svg';
  String get wifi => 'assets/icons/wifi.svg';
  List<dynamic> get values => [
        demography,
        empty,
        emptyUanimation,
        home,
        kyc,
        location,
        locationUpermission,
        people,
        profile,
        profileUbg,
        reject,
        schedule,
        send,
        success,
        wifi,
      ];
}

class $Logo {
  const $Logo();
  AssetGen get appUlauncher => const AssetGen('assets/logo/app_launcher.png');
  AssetGen get basicUlogoUdark => const AssetGen('assets/logo/basic_logo_dark.png');
  AssetGen get basicUlogoUlight => const AssetGen('assets/logo/basic_logo_light.png');
  String get iosUlauncher => 'assets/logo/ios_launcher.jpg';
  List<dynamic> get values => [
        appUlauncher,
        basicUlogoUdark,
        basicUlogoUlight,
        iosUlauncher,
      ];
}
