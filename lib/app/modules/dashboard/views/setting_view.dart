import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends GetView {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SettingView'),
      //   centerTitle: true,
      // ),
      body: const Center(
        child: Text(
          'SettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
