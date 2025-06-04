import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class CustomNotchBottomBar extends StatelessWidget {
  CustomNotchBottomBar({super.key});

  final DashboardController bottomBarController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      bottomBarWidth: MediaQuery.of(context).size.width,
      notchBottomBarController: NotchBottomBarController(
          index: bottomBarController.selectedIndex.value),
      color: Colors.white,
      kBottomRadius: 30.0,
      showLabel: true,
      notchColor: Colors.black87,
      removeMargins: false,
      durationInMilliSeconds: 300,
      itemLabelStyle: const TextStyle(fontSize: 10),
      elevation: 1,
      bottomBarItems: [
        BottomBarItem(
          inActiveItem: Icon(Icons.home_filled, color: Colors.blueGrey),
          activeItem: Icon(Icons.home_filled, color: Colors.blueAccent),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
          activeItem: Icon(Icons.star, color: Colors.blueAccent),
          itemLabel: 'Favorites',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.settings, color: Colors.blueGrey),
          activeItem: Icon(Icons.settings, color: Colors.pink),
          itemLabel: 'Settings',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.person, color: Colors.blueGrey),
          activeItem: Icon(Icons.person, color: Colors.yellow),
          itemLabel: 'Profile',
        ),
      ],
      onTap: (index) {
        log('Current selected index: $index');
        bottomBarController.changePage(index);
      },
      kIconSize: 24.0,
    );
  }
}
