import 'package:flutter/widgets.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/customer_form_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/profile_page_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/setting_view.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  RxInt selectedIndex = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;

  void changePage(int index) {
    selectedIndex.value = index;
    pageController.value.jumpToPage(index);
  }

  final List<Widget> bottomBarPages = [
    DashboardView(),
    CustomerFormView(),
    ProfilePageView(),
    SettingView(),
  ];

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }
}
