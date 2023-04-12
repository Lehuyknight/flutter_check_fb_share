import 'package:flutter/material.dart';
import 'package:flutter_train/app/controllers/hotel_controller.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateScreen extends GetView<HotelController> {
  const SelectDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime valueStart = controller.rangeStartDate.value;
    DateTime valueEnd = controller.rangeEndDate.value;
    return AppbarContainerWidget(
      titleString: 'Select date',
      implementLeading: true,
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            enablePastDates: false,
            selectionMode: DateRangePickerSelectionMode.range,
            rangeSelectionColor: Colors.amberAccent.withOpacity(0.2),
            monthViewSettings:
                const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.75),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            initialSelectedRange: PickerDateRange(
                controller.rangeStartDate.value, controller.rangeEndDate.value),
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                if (args.value.startDate != null) {
                  valueStart = args.value.startDate;
                }
                if (args.value.endDate != null) {
                  valueEnd = args.value.endDate;
                }
              }
            },
          ),
          CustomButtonWidget(
            title: 'Select',
            onTap: () {
              controller.rangeStartDate.value = valueStart;
              controller.rangeEndDate.value = valueEnd;
              Get.back();
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          CustomButtonWidget(
            title: 'Cancel',
            opacity: ColorPalette.primaryColor.withOpacity(0.2),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
