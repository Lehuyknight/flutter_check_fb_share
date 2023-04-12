import 'package:flutter_train/app/controllers/intro_controller.dart';
import 'package:flutter_train/app/data/provider/storage/storage_provider.dart';
import 'package:flutter_train/app/data/services/storage/repository.dart';
import 'package:get/get.dart';

class IntroBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IntroController>(IntroController(
        storageRepository:
            StorageRepository(storageProvider: StorageProvider())));
  }
}
