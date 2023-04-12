import 'package:flutter/material.dart';
import 'package:flutter_train/app/data/models/room_model.dart';
import 'package:flutter_train/app/helpers/assets_helpers.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/global_widgets/room_card_widget.dart';
import 'package:get/get.dart';

class RoomSelectScreen extends GetView {
  RoomSelectScreen({super.key});
  final List<RoomModel> roomModels = [
    RoomModel(
      roomImage: AssetsHelper.room1,
      roomName: 'Deluxe Room',
      utility: "Free Cancelation",
      size: 23,
      price: 237,
    ),
    RoomModel(
      roomImage: AssetsHelper.room2,
      roomName: 'Single Room',
      utility: "Non-Refundable",
      size: 32,
      price: 289,
    ),
    RoomModel(
      roomImage: AssetsHelper.room3,
      roomName: 'King Room',
      utility: "With Massage Service",
      size: 35,
      price: 314,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppbarContainerWidget(
      titleString: 'Select Room',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: roomModels.map((e) => RoomCardWidget(room: e)).toList(),
        ),
      ),
    );
  }
}
