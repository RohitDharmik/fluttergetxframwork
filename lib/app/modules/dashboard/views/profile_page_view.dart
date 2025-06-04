import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfilePageView extends GetView {
  const ProfilePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilePageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
