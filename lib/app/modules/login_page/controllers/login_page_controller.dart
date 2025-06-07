import 'package:get/get.dart';

class LoginPageController extends GetxController {
  // Observable variable to track loading state
  var isLoading = false.obs;
  var isRememberMe = false.obs;

// Method to handle login logic
  void login(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Gmail and password cannot be empty');
      return;
    }

    isLoading.value = true;
    // Simulate a network call with a delay
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      print("123456");
      Get.snackbar('Success', 'Logged in as $username');
      // Get.offNamed('/dashboard'); // Navigate to home page
      // Navigate to home page or perform other actions
    });
  }

  // Method to handle OTP validation logic
  void validateOtp(String otp) {
    if (otp.isEmpty) {
      Get.snackbar('Error', 'OTP cannot be empty');
      return;
    }

    isLoading.value = true;
    // Simulate OTP validation with a delay
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      if (otp == "123456") {
        // Example OTP check
        Get.snackbar('Success', 'OTP validated successfully');
        Get.offNamed('/dashboard');
      } else {
        Get.snackbar('Error', 'Invalid OTP');
      }
    });
  }
}
