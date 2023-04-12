import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/storage/repository.dart';

class IntroController extends GetxController {
  final pageController = PageController();
  final buttonText = 'Next!'.obs;
  final StorageRepository storageRepository;
  IntroController({required this.storageRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController.addListener(() {
      pageController.page! > 1.8
          ? buttonText.value = 'Get Started'
          : buttonText.value = 'Next!';
    });
  }

  void beYourFirstTime() {
    storageRepository.beYourFirstTime();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    pageController.dispose();
    super.onClose();
  }
}
