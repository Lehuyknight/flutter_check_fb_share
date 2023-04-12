import 'package:flutter/material.dart';
import 'package:flutter_train/app/controllers/hotel_controller.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemAddGuestAddRoom extends StatefulWidget {
  const ItemAddGuestAddRoom({
    super.key,
    required this.iconData,
    required this.title,
    required this.iconColor,
    required this.hotelController,
    required this.handlerNumber,
  });

  final Rx<int> handlerNumber;
  final HotelController hotelController;
  final Color iconColor;
  final IconData iconData;
  final String title;

  @override
  State<ItemAddGuestAddRoom> createState() => _ItemAddGuestAddRoomState();
}

class _ItemAddGuestAddRoomState extends State<ItemAddGuestAddRoom> {
  late int number;

  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number = widget.handlerNumber.value;
    _textEditingController = TextEditingController(text: number.toString())
      ..addListener(() {
        try {
          number = int.parse(_textEditingController.text);
          widget.handlerNumber.value = number;
        } catch (err) {
          number = 0;
          widget.handlerNumber.value = number;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTopPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(widget.iconData, color: widget.iconColor),
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Text(widget.title),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 0) {
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                });
              }
            },
            child: const Icon(
              FontAwesomeIcons.circleMinus,
              color: ColorPalette.primaryColor,
            ),
          ),
          Container(
            height: 35,
            width: 60,
            padding: const EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 18),
              ),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              });
            },
            child: const Icon(
              FontAwesomeIcons.circlePlus,
              color: ColorPalette.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
