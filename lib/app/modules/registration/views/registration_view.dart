import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());
  final TextEditingController emailController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Send OTP'),
              onPressed: () {
                if (emailController.text.isNotEmpty) {
                  controller.sendOtp(emailController.text.trim());
                  Get.bottomSheet(OtpSheet());
                } else {
                  Get.snackbar('Error', 'Please enter your email');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
