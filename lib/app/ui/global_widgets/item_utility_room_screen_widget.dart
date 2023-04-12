import 'package:flutter/material.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/item_class.dart';

class ItemUtilityWidget extends StatelessWidget {
  List<ItemClass>? itemList;
  List<ItemClass> defaultItemList = [
    ItemClass(
        iconData: Icons.wifi,
        color: const Color(0xff6155CC),
        text: 'Free\nWifi'),
    ItemClass(
        iconData: FontAwesomeIcons.creativeCommonsNc,
        color: const Color(0xffFE9C5E),
        text: 'Non-\nRefundable'),
    ItemClass(
        iconData: FontAwesomeIcons.utensils,
        color: const Color(0xffF77777),
        text: 'Free\nBreakfast'),
    ItemClass(
        iconData: FontAwesomeIcons.banSmoking,
        color: const Color(0xff3EC8BC),
        text: 'No\nSmoking'),
  ];
  ItemUtilityWidget({super.key, this.itemList});

  Widget _buildItemUltility(ItemClass item) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14.0)),
            color: item.color.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              item.iconData,
              color: item.color,
            ),
          ),
        ),
        Text(
          item.text,
          textAlign: TextAlign.center,
          maxLines: 2,
        )
      ],
    );
  }
  

  @override
  Widget build(BuildContext context) {
    itemList ?? (itemList = defaultItemList);
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: itemList!.map((e) => _buildItemUltility(e)).toList(),
      ),
    );
  }
}
