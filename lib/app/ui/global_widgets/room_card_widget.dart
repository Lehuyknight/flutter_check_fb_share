import 'package:flutter/material.dart';
import 'package:flutter_train/app/data/models/room_model.dart';
import 'package:flutter_train/app/helpers/image_helpers.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/global_widgets/dashline_widget.dart';
import 'package:flutter_train/app/ui/global_widgets/item_utility_room_screen_widget.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:flutter_train/app/ui/utils/textstyle_ext.dart';
import 'package:get/get.dart';

import '../../routes/pages.dart';
import '../utils/item_class.dart';

class RoomCardWidget extends StatelessWidget {
  const RoomCardWidget(
      {super.key, required this.room, this.itemList, this.numberOfRoom});
  final RoomModel room;
  final List<ItemClass>? itemList;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          color: Colors.white),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Room Size: ${room.size} m2',
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(room.utility),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(
                  room.roomImage,
                  radius: BorderRadius.circular(kItemPadding),
                ),
              )
            ],
          ),
          ItemUtilityWidget(itemList: itemList),
          const DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${room.price.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/night',
                      style: TextStyles.defaultStyle.fontCaption,
                    )
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? CustomButtonWidget(
                        title: 'Choose',
                        onTap: () {
                          Get.toNamed(Routes.CHECK_OUT_ROOM, arguments: room);
                        },
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
