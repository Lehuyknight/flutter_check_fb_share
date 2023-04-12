import 'package:flutter/material.dart';
import 'package:flutter_train/app/helpers/assets_helpers.dart';
import 'package:flutter_train/app/helpers/image_helpers.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetsHelper.imageBgSplash,
            fit: BoxFit.fitWidth,
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
          ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetsHelper.imageCircleSplash,
            fit: BoxFit.fitWidth,
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
          ),
        ),
      ],
    );
  }
}
