import 'package:flutter/material.dart';
import 'package:flutter_train/app/controllers/home_controller.dart';
import 'package:flutter_train/app/helpers/assets_helpers.dart';
import 'package:flutter_train/app/helpers/image_helpers.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding)),
          child: icon,
        ),
        const SizedBox(
          height: kItemPadding,
        ),
        Text(title)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppbarContainerWidget(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi James',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: kMediumPadding,
              ),
              Text(
                '''Where're you going next?''',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            FontAwesomeIcons.bell,
            size: kDefaultIconSize,
            color: Colors.white,
          ),
          const SizedBox(
            width: kTopPadding,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kItemPadding),
                color: Colors.white,
                backgroundBlendMode: BlendMode.src),
            padding: const EdgeInsets.all(kMinPadding),
            child: ImageHelper.loadFromAsset(AssetsHelper.avatarDefault),
          )
        ]),
      ),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultIconSize,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFromAsset(
                        AssetsHelper.hotel,
                        width: kBottomBarIconSize,
                        height: kBottomBarIconSize,
                      ),
                      const Color(0xFFfe9c5e),
                      () => Get.toNamed(Routes.HOTEL),
                      'Hotel'),
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetsHelper.plane,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    const Color(0xFFF77777),
                    () => null,
                    'Flights'),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetsHelper.hotelPlane,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    const Color(0xFF3EC8BC),
                    () => null,
                    'All'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
