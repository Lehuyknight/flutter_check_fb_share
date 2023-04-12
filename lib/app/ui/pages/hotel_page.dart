import 'package:flutter/material.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/global_widgets/booking_item_widget.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/hotel_controller.dart';

class HotelPage extends GetView<HotelController> {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarContainerWidget(
      titleString: "Hotel",
      implementLeading: true,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: kMediumPadding * 2,
              ),
              const BookingItemWidget(
                title: 'Desitnation',
                icon: FontAwesomeIcons.locationDot,
                description: 'Seoul',
                color: Color(0xFFFE9C5E),
                iconColor: Color(0x2fFE9C5E),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Obx(
                () => BookingItemWidget(
                  title: 'Select date',
                  icon: FontAwesomeIcons.calendarCheck,
                  description: controller.createTimeString(),
                  color: const Color(0xffF77777),
                  iconColor: const Color(0x2fF77777),
                  onTap: () {
                    Get.toNamed(Routes.SELECT_DATE);
                  },
                ),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Obx(
                () => BookingItemWidget(
                  title: 'Guest and Room',
                  icon: FontAwesomeIcons.bed,
                  description:
                      '''${controller.initGuest} Guest ${controller.initRoom} Room''',
                  color: const Color(0xff3EC8BC),
                  iconColor: const Color(0x2f3EC8BC),
                  onTap: () {
                    Get.toNamed(Routes.SELECT_ROOM);
                  },
                ),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              CustomButtonWidget(
                title: 'Search',
                onTap: () {
                  Get.toNamed(Routes.SEARCH_HOTEL);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
