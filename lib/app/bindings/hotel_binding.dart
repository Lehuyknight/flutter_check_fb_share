import 'package:flutter_train/app/controllers/hotel_controller.dart';
import 'package:get/get.dart';

class HotelBinding implements Bindings {
@override
void dependencies() {
  Get.put<HotelController>(HotelController());
  }
}