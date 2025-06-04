import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  // Show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  // Hide loading
  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  // Show error dialog
  static void showError(String message) {
    Get.dialog(
      AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Show snackbar
  static void showSnackbar(String message) {
    Get.snackbar('Info', message, snackPosition: SnackPosition.BOTTOM);
  }
}
