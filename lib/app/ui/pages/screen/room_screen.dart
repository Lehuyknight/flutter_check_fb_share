import 'package:flutter/material.dart';
import 'package:flutter_train/app/controllers/hotel_controller.dart';
import 'package:flutter_train/app/ui/global_widgets/item_add_guest_and_room.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/appbar_container.dart';
import '../../global_widgets/button_widget.dart';

class RoomScreen extends GetView<HotelController> {
  RoomScreen({super.key});

  final _hotelControler = Get.find<HotelController>();

  @override
  Widget build(BuildContext context) {
    return AppbarContainerWidget(
      titleString: 'Add guest and room',
      implementLeading: true,
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          ItemAddGuestAddRoom(
            iconData: FontAwesomeIcons.person,
            title: 'Guest',
            iconColor: const Color(0xffFE9C5E),
            hotelController: _hotelControler,
            handlerNumber: _hotelControler.initGuest,
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ItemAddGuestAddRoom(
            iconData: FontAwesomeIcons.bedPulse,
            title: 'Room',
            iconColor: const Color(0xffF77777),
            hotelController: _hotelControler,
            handlerNumber: _hotelControler.initRoom,
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          CustomButtonWidget(
            title: 'Done',
            onTap: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
