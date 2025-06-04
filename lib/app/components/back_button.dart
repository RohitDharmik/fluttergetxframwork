import 'package:flutter/material.dart';

backButton(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 4),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => Navigator.pop(context, true),
        child: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
            )),
      ),
    ),
  );
}
