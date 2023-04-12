import 'package:flutter_train/app/controllers/splash_controller.dart';
import 'package:flutter_train/app/data/services/storage/repository.dart';
import 'package:get/get.dart';

import '../data/provider/storage/storage_provider.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
        SplashController(storageRepository: StorageRepository(storageProvider: StorageProvider())));
  }
}
