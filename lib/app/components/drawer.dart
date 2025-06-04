import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/components/widgets.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
            // UserAccountsDrawerHeader(
            //   currentAccountPictureSize: const Size(70, 70),
            //   arrowColor: kwhiteColor,
            //   accountName: Row(
            //     children: [
            //       if (name != null)
            //         Text("$name", style: TextStyle(fontSize: 18.sp)),
            //       SizedBox(width: 8),
            //       if (customerTypeName != null)
            //         Text("($customerTypeName)",
            //             style: TextStyle(fontSize: 16.sp)),
            //     ],
            //   ),
            //   accountEmail: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       if (mobileNo != null)
            //         Row(
            //           children: [
            //             Text("+91 $mobileNo",
            //                 style: TextStyle(fontSize: 14.sp)),
            //             SizedBox(width: 16),
            //           ],
            //         ),
            //       if (cityName != null)
            //         Text("$cityName",
            //             style: TextStyle(
            //                 fontSize: 14.sp, fontWeight: FontWeight.w500)),
            //     ],
            //   ),
            //   decoration: const BoxDecoration(
            //     color: kbackgroundColor,
            //   ),
            //   currentAccountPicture: Column(
            //     children: [
            //       Container(
            //         height: 60,
            //         width: 60,
            //         margin: EdgeInsets.only(right: 8),
            //         decoration: BoxDecoration(
            //             color: Colors.grey.shade50,
            //             border: Border.all(color: Colors.grey.shade300),
            //             borderRadius: BorderRadius.circular(50),
            //             image: profilePic != null
            //                 ? DecorationImage(
            //                     image: NetworkImage('$profilePic'),
            //                     fit: BoxFit.cover,
            //                   )
            //                 : null),
            //         child: profilePic == null
            //             ? Icon(
            //                 Icons.person,
            //                 size: 18,
            //                 color: Theme.of(context).primarySwatch,
            //               )
            //             : null,
            //       ),
            //     ],
            //   ),
            //   onDetailsPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),

            // if (role != null)
            //   ListTile(
            //     leading: const Icon(Icons.verified_user_outlined),
            //     title: const Text("Profile"),
            //     trailing: const Icon(Icons.navigate_next_outlined),
            //     onTap: () {
            //       //box.read("role").toString() == "team" ? CustomerProfileScreen() : const ProfilePage(),
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (BuildContext context) => const ProfilePage(),
            //         ),
            //       );
            //     },
            //   ),
            // box.read("role").toString() == "5"
            //     ? SizedBox()
            //     : ListTile(
            //         leading: const Icon(Icons.error_outline),
            //         title: const Text("Complaint"),
            //         trailing: const Icon(Icons.navigate_next_outlined),
            //         onTap: () {
            //           Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (BuildContext context) => ComplaintsScreen(),
            //             ),
            //           );
            //         },
            //       ),
            ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text("Feedback"),
              trailing: const Icon(Icons.navigate_next_outlined),
              onTap: () {
                Get.toNamed('/profile-pageView');
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.touch_app_outlined),
            //   title: const Text("About app"),
            //   trailing: const Icon(Icons.navigate_next_outlined),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const AboutUs()));
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.share_outlined),
            //   title: const Text("Share app"),
            //   trailing: const Icon(Icons.navigate_next_outlined),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Share.share('https://play.google.com/store/apps/details?id=app.ordermanagement.programmics');
            //   },
            // ),

            // ListTile(
            //   leading: const Icon(Icons.announcement_outlined),
            //   title: const Text("Terms and conditions"),
            //   trailing: const Icon(Icons.navigate_next_outlined),
            //   onTap: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (BuildContext context) => const TermsnCondition()));
            //   },
            // ),

            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
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
