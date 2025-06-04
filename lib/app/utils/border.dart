import 'package:flutter/material.dart';

class Outlineborders {
  boxBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1, color: Colors.black12),
    );
  }
}
