import 'package:flutter_train/app/data/services/storage/storage_services.dart';
import 'package:get/get.dart';

class StorageProvider {
  final StorageService _stogare = Get.find<StorageService>();
  bool isFirstTime() {
    if (_stogare.read('isFirstTime') == null) {
      return true;
    } else {
      return false;
    }
  }

  void firstTime() {
    _stogare.write('isFirstTime', true);
  }
}
