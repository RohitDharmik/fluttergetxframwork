import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/modules/registration/views/otpSheet.dart';
import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  @override
  final RegistrationController controller = Get.put(RegistrationController());
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                "assets/images/login.png", // Replace with your asset or use a placeholder
                height: 200,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Sign up',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Confirm Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  // Handle sign up
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty) {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      controller.register(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      controller.sendOtp(emailController.text.trim());
                      Get.bottomSheet(OtpSheet());
                    } else {
                      Get.snackbar('Error', 'Passwords do not match');
                    }
                  } else {
                    Get.snackbar('Error', 'Please fill all fields');
                  }
                },
                child: const Text('Continue', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Switch to login
                  Get.toNamed("/login-page");
                },
                child: RichText(
                  text: TextSpan(
                    text: "Joined us before? ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
