import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/components/drawer.dart';
import 'package:flutter_getx_mvc_framework/app/services/analyticsscreen.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return AnalyticsScreen(
      screenName: 'DashboardView',
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: const Text('DashboardView'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings page
                Get.toNamed('/setting-view');
              },
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'DashboardView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
