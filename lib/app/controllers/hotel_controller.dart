import 'package:flutter/material.dart';
import 'package:flutter_train/app/extensions/date_extension.dart';
import 'package:get/get.dart';

class HotelController extends GetxController {
  FocusNode focusNodeGuest = FocusNode();
  FocusNode focusNodeRoom = FocusNode();
  var initGuest = 0.obs;
  var initRoom = 0.obs;
  Rx<DateTime> rangeEndDate = DateTime.now().add(const Duration(days: 7)).obs;
  Rx<DateTime> rangeStartDate = DateTime.now().obs;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  String createTimeString() {
    {
      return '''${rangeStartDate.value.getStartDate} - ${rangeEndDate.value.getEndDate}''';
    }
  }
}
