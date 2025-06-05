import 'package:flutter_getx_mvc_framework/app/components/splash_screen.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/customer_form_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/profile_page_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/setting_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SplashScreen;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CustomerFormView,
      page: () => const CustomerFormView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ProfilePageView,
      page: () => const ProfilePageView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SettingView,
      page: () => const SettingView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SplashScreen,
      page: () => const SplashScreen(),
    ),
  ];
}
