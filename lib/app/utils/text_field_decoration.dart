import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon: Icon(icon),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  );
}

var screenWidth;
var screenHeight;
// Color submitButtonColor = Color.fromRGBO(75, 153, 90, 1);
// Color bottomNavBarSelectedBGColor = Color.fromRGBO(219, 232, 249, 1);
// Color bottomNavBarSelectedTextColor = Color.fromRGBO(15, 36, 62, 1);
// Color bottomNavBarTextColor = Color.fromRGBO(75, 75, 78, 1);
String currentBottomNavigationIndex = "0";
String currentTopBarModuleName = "Dashboard";
Color bottomNavBarTextColor = Color.fromRGBO(75, 75, 78, 1);
Color submitButtonColor = Color.fromRGBO(75, 153, 90, 1);
Color bottomNavBarSelectedBGColor = Color.fromRGBO(219, 232, 249, 1);
Color bottomNavBarSelectedTextColor = Color.fromRGBO(15, 36, 62, 1);
Color appBarColor = Color.fromRGBO(15, 36, 62, 1);
Color appBarTextColor = Colors.white;
