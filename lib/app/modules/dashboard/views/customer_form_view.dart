import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomerFormView extends GetView {
  const CustomerFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomerFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CustomerFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
