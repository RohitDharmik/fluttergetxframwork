import 'dart:convert';

import 'package:flutter_getx_mvc_framework/app/services/analytics.dart';
import 'package:flutter_getx_mvc_framework/app/services/connections.dart'; // Import your ApiClient
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPageController extends GetxController {
  // Observable variable to track loading state
  var isLoading = false.obs;
  final ApiClient apiClient = ApiClient(); // Create an instance
  final box = GetStorage(); // Add this line

  // Method to handle login logic
  void login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username and password cannot be empty');
      return;
    }

    isLoading.value = true;

    // Call the API
    final response = await apiClient.postData(
      'auth/login',
      {
        'username': username,
        'password': password,
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      print(response.body);
      final data =
          response.body is String ? jsonDecode(response.body) : response.body;
      final accessToken = data['token'] ?? data['accessToken'];
      if (accessToken != null) {
        box.write('accessToken', accessToken); // Save token
      }
      AnalyticsEvent.getSingleton().setUserLogin();
      Get.snackbar('Success', 'Logged in as $username');
      // Get.toNamed('/dashboard'); // Navigate to home page
    } else {
      Get.snackbar('Login Failed', response.statusText ?? 'Unknown error');
    }
  }
}
