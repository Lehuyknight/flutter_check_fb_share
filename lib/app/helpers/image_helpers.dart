import 'package:flutter/material.dart';

class ImageHelper {
  static Widget loadFromAsset(ImageProvider imageAsset,
      {double? width,
      double? height,
      BorderRadius? radius,
      BoxFit? fit,
      Color? tintColor,
      Alignment? alignment}) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image(
        image: imageAsset,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}
