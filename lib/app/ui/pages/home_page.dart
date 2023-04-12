import 'package:flutter/material.dart';
import 'package:flutter_train/app/controllers/home_controller.dart';
import 'package:flutter_train/app/ui/pages/home/home_screen.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => IndexedStack(
          index: controller.bottomIndex.value,
          children: [
            const HomeScreen(),
            Container(
              color: Colors.black,
            ),
            Container(
              color: Colors.cyan,
            ),
            Container(
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: controller.bottomIndex.value,
          onTap: (value) {
            controller.bottomIndex.value = value;
          },
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(
              horizontal: kMediumPadding, vertical: kDefaultPadding),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.house,
                size: kDefaultIconSize,
              ),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidHeart,
                size: kDefaultIconSize,
              ),
              title: const Text('Favorites'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.briefcase,
                size: kDefaultIconSize,
              ),
              title: const Text('Bookings'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidUser,
                size: kDefaultIconSize,
              ),
              title: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
