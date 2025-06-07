import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  LoginPageView({super.key});

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
                height: 250,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'login',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Enter your email address',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Enter your password',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle forgot password
                    // Get.to(() => ForgotPasswordScreen());
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (context) {
                      final TextEditingController otpController =
                          TextEditingController();
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 24,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Enter OTP',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: otpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Enter OTP',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validate OTP here
                                  controller.login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
                                  // Optionally show success/failure message
                                },
                                child: const Text('Validate OTP'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  // Handle sign up
                },
                child: const Text('Continue', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/registration");
                },
                child: RichText(
                  text: TextSpan(
                    text: "New here?  ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Create an account",
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
