import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      elevation: 0,
      title: Image.asset(
        "assets/images/google-icon.png",
        color: Colors.white,
        width: 110,
        height: 80,
      ),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          onPressed: () {
            print("  Icon Pressed");
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            print("  Icon Pressed");
          },
        ),
      ],
    );
  }

  static AppBar buildAppBarWithActions(
      BuildContext context, VoidCallback press) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      centerTitle: true,
      title: const Image(
        image: AssetImage("assets/white_paw.png"),
      ),
      actions: [
        IconButton(onPressed: press, icon: const Icon(Icons.add_box_outlined))
      ],
    );
  }
}
