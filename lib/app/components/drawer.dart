import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/components/widgets.dart';
import 'package:flutter_getx_mvc_framework/app/controllers/location_controller.dart';
import 'package:flutter_getx_mvc_framework/app/utils/helper.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
        //
        // other styles
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: kHeight * 0.3,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade50,
                    backgroundImage: CachedNetworkImageProvider(
                      'https://example.com/profile_pic.png',
                    ),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  SizedBox(height: kHeight * 0.02),
                  Text(
                    'User Name', // Replace with actual user name
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kHeight * 0.02,
            ),
            ListTile(
              leading: const Icon(Icons.add_location_alt_outlined),
              title: const Text("Google Location"),
              trailing: const Icon(Icons.navigate_next_outlined),
              onTap: () async {
                await locationController.getCurrentLocation();
                final pos = locationController.currentPosition.value;

                if (pos != null) {
                  Get.defaultDialog(
                    title: "Your Location",
                    middleText:
                        "Latitude: ${pos.latitude}\nLongitude: ${pos.longitude}",
                    textConfirm: "OK",
                    onConfirm: () => Get.back(),
                  );
                } else {
                  Get.snackbar(
                    "Location Error",
                    "Could not get location.",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: const Text("Completed Tasks"),
              trailing: const Icon(Icons.navigate_next_outlined),
              onTap: () async {
                Get.toNamed('/customer-formView');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
              trailing: const Icon(Icons.navigate_next_outlined),
              onTap: () async {
                logoutPopUp(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
