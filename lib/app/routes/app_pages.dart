import 'package:get/get.dart';

import '../components/splash_screen.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/customer_form_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/views/profile_page_view.dart';
import '../modules/dashboard/views/setting_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

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
      page: () => DashboardView(),
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
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
  ];
}
