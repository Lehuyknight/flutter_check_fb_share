import 'package:flutter/material.dart';
import 'package:flutter_train/app/data/services/storage/storage_services.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main(List<String> args) async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      initialRoute: Routes.SIGNUP,
      getPages: AppPages.pages,
    );
  }
}
