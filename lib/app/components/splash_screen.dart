import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/utils/helper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed("login-page"); // Change '/login' to your login route name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or icon
            Image.asset(
              splashIcon,
              height: kHeight * 0.3,
              width: kWidth * 0.5,
            ),
            const SizedBox(height: 24),
            // App name or loading text
            Text(
              'Welcome to Text3Flutter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
