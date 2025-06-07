import 'dart:math';

import 'package:get/get.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController
// your existing imports and class definition

  // your existing code

  void register({required String email, required String password}) {
    // TODO: Implement registration logic here
    print('Registering user: $email');
  }

  final email = ''.obs;
  final generatedOtp = ''.obs;

  void sendOtp(String userEmail) {
    email.value = userEmail;
    generatedOtp.value = (100000 + Random().nextInt(900000)).toString();
    // Simulate sending OTP by logging to console
    print('OTP for $userEmail is ${generatedOtp.value}');
  }

  bool verifyOtp(String enteredOtp) {
    return enteredOtp == generatedOtp.value;
  }

  void clearOtp() {
    generatedOtp.value = '';
    email.value = '';
  }
}
