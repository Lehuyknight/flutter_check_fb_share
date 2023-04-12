import 'package:flutter_train/app/bindings/home_binding.dart';
import 'package:flutter_train/app/bindings/hotel_binding.dart';
import 'package:flutter_train/app/bindings/intro_binding.dart';
import 'package:flutter_train/app/bindings/splash_binding.dart';
import 'package:flutter_train/app/ui/pages/home_page.dart';
import 'package:flutter_train/app/ui/pages/hotel_page.dart';
import 'package:flutter_train/app/ui/pages/intro_screen.dart';
import 'package:flutter_train/app/ui/pages/login_page.dart';
import 'package:flutter_train/app/ui/pages/screen/check_out_screen.dart';
import 'package:flutter_train/app/ui/pages/screen/hotel_details_screen.dart';
import 'package:flutter_train/app/ui/pages/screen/room_screen.dart';
import 'package:flutter_train/app/ui/pages/screen/room_select_screen.dart';
import 'package:flutter_train/app/ui/pages/screen/search_hotel_screen.dart';
import 'package:flutter_train/app/ui/pages/screen/select_date_screen.dart';
import 'package:flutter_train/app/ui/pages/signup_page.dart';
import 'package:flutter_train/app/ui/pages/splash_screen.dart';
import 'package:get/get.dart';

import '../bindings/login_binding.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.INTRO,
        page: () => const IntroPage(),
        binding: IntroBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupPage(),
    ),
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.HOTEL,
        page: () => const HotelPage(),
        binding: HotelBinding()),
    GetPage(
        name: Routes.SELECT_DATE,
        page: () => const SelectDateScreen(),
        binding: HotelBinding()),
    GetPage(
      name: Routes.SELECT_ROOM,
      page: () => RoomScreen(),
    ),
    GetPage(
      name: Routes.SEARCH_HOTEL,
      page: () => const SearchHotelScreen(),
    ),
    GetPage(name: Routes.HOTEL_DETAIL, page: () => const HotelDetailsScreen()),
    GetPage(
      name: Routes.HOTEL_ROOM_SELECT_DETAIL,
      page: () => RoomSelectScreen(),
    ),
    GetPage(
      name: Routes.CHECK_OUT_ROOM,
      page: () => CheckOutScreen(),
    ),
  ];
}
