import 'package:flutter/material.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/global_widgets/room_card_widget.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:flutter_train/app/ui/utils/textstyle_ext.dart';
import 'package:get/get.dart';

import '../../../data/models/room_model.dart';

class CheckOutScreen extends GetView {
  CheckOutScreen({super.key});
  final List<String> steps = ['Book and Review', 'Payment', 'Confirm'];

  Widget _buildItemOptions(IconData icon, String title, String value,
      Color color, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                  color: color.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              )
            ],
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kMediumPadding),
                        color: Colors.white),
                    alignment: Alignment.center,
                    child: const Icon(Icons.add)),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Text(
                  value,
                  style: TextStyles.defaultStyle.primaryTextColor.bold,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemStep(int step, String nameStep, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kMediumPadding),
              color: Colors.white.withOpacity(isCheck ? 1 : 0.1)),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyles.defaultStyle
                .copyWith(color: isCheck ? null : Colors.white),
          ),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        Text(
          nameStep,
          style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          const SizedBox(
              width: kDefaultPadding,
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
              )),
        if (!isEnd)
          const SizedBox(
            width: kMinPadding,
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    RoomModel room = Get.arguments;

    return AppbarContainerWidget(
      titleString: 'Checkout',
      implementLeading: true,
      child: Column(
        children: [
          Row(
            children: steps
                .map((e) => _buildItemStep(
                    steps.indexOf(e),
                    e,
                    steps.indexOf(e) == steps.length - 1,
                    steps.indexOf(e) == 0))
                .toList(),
          ),
          const SizedBox(
            height: kMinPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  RoomCardWidget(
                    room: room,
                    numberOfRoom: 1,
                  ),
                  _buildItemOptions(Icons.person, 'Contact Details',
                      'Add Contact', const Color(0xff6155CC), context),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  _buildItemOptions(Icons.discount, 'Promo Code',
                      'Add Promo Code', const Color(0xffFE9C5E), context),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  CustomButtonWidget(
                    title: 'Payment',
                    onTap: () {
                      Get.offNamedUntil(Routes.HOME, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
