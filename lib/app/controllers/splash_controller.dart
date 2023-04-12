import 'package:flutter_train/app/data/services/storage/repository.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final StorageRepository storageRepository;
  SplashController({required this.storageRepository});

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    storageRepository.isFirstTime()
        ? Get.offAllNamed(Routes.INTRO)
        : Get.offAllNamed(Routes.HOME);
  }
}
