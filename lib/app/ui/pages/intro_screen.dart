import 'package:flutter/material.dart';
import 'package:flutter_train/app/helpers/assets_helpers.dart';
import 'package:flutter_train/app/helpers/image_helpers.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:flutter_train/app/ui/utils/textstyle_ext.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/intro_controller.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildItemIntroScreen(ImageProvider assetImage, String title,
        String description, AlignmentGeometry alignment) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: alignment,
            child: ImageHelper.loadFromAsset(
              assetImage,
              height: 400,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyles.defaultStyle.bold,
                ),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  description,
                  style: TextStyles.defaultStyle,
                ),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            children: [
              _buildItemIntroScreen(
                  AssetsHelper.imageIntro1,
                  'Book a flight',
                  '''Found a flight that matches your destination 
and schedule? Book it instantly.''',
                  Alignment.centerRight),
              _buildItemIntroScreen(
                  AssetsHelper.imageIntro2,
                  'Find a hotel room',
                  '''Select the day, book your room. We give you 
the best price.''',
                  Alignment.center),
              _buildItemIntroScreen(
                  AssetsHelper.imageIntro3,
                  'Enjoy your trip',
                  '''Easy discovering new places and share these 
between your friends and travel together.''',
                  Alignment.centerLeft)
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.orangeAccent,
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Obx(() => CustomButtonWidget(
                        title: controller.buttonText.value,
                        onTap: () {
                          if (controller.pageController.page != 2) {
                            controller.pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                          } else {
                            controller.beYourFirstTime();
                            Get.offNamed(Routes.HOME);
                          }
                        },
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
