import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/modules/registration/controllers/registration_controller.dart';
import 'package:get/get.dart';
 
class OtpSheet extends StatelessWidget {
  final RegistrationController controller = Get.find();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Enter the 6-digit OTP sent to your email'),
          const SizedBox(height: 16),
          TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: const InputDecoration(
              labelText: 'OTP',
              counterText: '',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Verify'),
            onPressed: () {
              if (controller.verifyOtp(otpController.text.trim())) {
                Get.back();
                Get.snackbar('Success', 'OTP Verified!');
              } else {
                Get.snackbar('Error', 'Invalid OTP');
              }
            },
          ),
        ],
      ),
    );
  }
}