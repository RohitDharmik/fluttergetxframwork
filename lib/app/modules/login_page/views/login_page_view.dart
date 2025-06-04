import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/utils/text_field_decoration.dart';
import 'package:get/get.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration:
                    customInputDecoration('Username', CupertinoIcons.person),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration:
                    customInputDecoration('Password', CupertinoIcons.lock),
                obscureText: true,
              ),
              SizedBox(height: 24),
              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          controller.login(
                            usernameController.text,
                            passwordController.text,
                          );
                        },
                        child: Text('Login'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
