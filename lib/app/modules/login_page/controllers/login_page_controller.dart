import 'package:get/get.dart';

class LoginPageController extends GetxController {
  // Observable variable to track loading state
  var isLoading = false.obs;

  // Method to handle login logic
  void login(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username and password cannot be empty');
      return;
    }

    isLoading.value = true;

    // Simulate a network call with a delay
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar('Success', 'Logged in as $username');
      Get.toNamed('/dashboard'); // Navigate to home page
      // Navigate to home page or perform other actions
    });
  }
}
