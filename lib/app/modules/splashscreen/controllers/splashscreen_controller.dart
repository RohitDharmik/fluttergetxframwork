import 'package:flutter_getx_mvc_framework/app/modules/login_page/views/login_page_view.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(LoginPageView()); // Change '/login' to your login route name
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
