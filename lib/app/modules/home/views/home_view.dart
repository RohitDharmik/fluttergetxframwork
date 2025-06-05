import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.bottomSheet(
                Container(
                  // .h is used for adding constant height for all screens, it will take only 120 logical vertical pixels on each and every device size
                  height: 120.h,
                  // .w is used for adding constant height for all screens, it will take only 120 logical horizontal pixels on each and every device size
                  width: 360.w,
                  // .sm is used for margins and paddings
                  padding: EdgeInsets.symmetric(horizontal: 30.sm),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      // .r is used for radius
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.changeThemeMode(ThemeMode.light);
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 25.r,
                          child: Center(
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.changeThemeMode(ThemeMode.dark);
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 25.r,
                          child: Center(
                            child: Icon(
                              CupertinoIcons.download_circle_fill,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.sm),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
