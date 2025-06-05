import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/utils/helper.dart';
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
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/login.png",
                  width: double.infinity,
                  height: double.infinity,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: usernameController,
                      decoration: customInputDecoration(
                          'Username', CupertinoIcons.person),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: customInputDecoration(
                          'Password', CupertinoIcons.lock),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    Obx(
                      () => controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                controller.login(
                                  usernameController.text,
                                  passwordController.text,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: kwhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Or login with',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(CupertinoIcons.gear),
                          onPressed: () {
                            // Handle Apple login
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.g_mobiledata),
                          onPressed: () {
                            // Handle Google login
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.facebook),
                          onPressed: () {
                            // Handle Facebook login
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign up page
                      },
                      child: Text(
                        'Don\'t have an account? Sign Up',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    )

        //  Stack(
        //   children: [
        //     Container(
        //       color: Colors.white,
        //       child: Container(
        //         padding: EdgeInsets.all(20),
        //         margin: EdgeInsets.symmetric(horizontal: 24, vertical: 150),
        //         decoration: BoxDecoration(
        //             color: Theme.of(context).focusColor,
        //             borderRadius: BorderRadius.circular(12),
        //             boxShadow: [
        //               BoxShadow(
        //                   color: Theme.of(context).secondaryHeaderColor,
        //                   spreadRadius: 2,
        //                   blurRadius: 13)
        //             ]),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               'LOGIN',
        //               style: TextStyle(
        //                 fontSize: 24,
        //                 fontWeight: FontWeight.bold,
        //                 color: const Color.fromARGB(255, 2, 134, 241),
        //               ),
        //             ),
        //             SizedBox(height: 24),
        //             TextFormField(
        //               controller: usernameController,
        //               decoration: customInputDecoration(
        //                   'Username', CupertinoIcons.person),
        //             ),
        //             SizedBox(height: 16),
        //             TextFormField(
        //               controller: passwordController,
        //               decoration:
        //                   customInputDecoration('Password', CupertinoIcons.lock),
        //               obscureText: true,
        //             ),
        //             SizedBox(height: 24),
        //             Obx(
        //               () => controller.isLoading.value
        //                   ? CircularProgressIndicator()
        //                   : GestureDetector(
        //                       onTap: () {
        //                         controller.login(
        //                           usernameController.text,
        //                           passwordController.text,
        //                         );
        //                       },
        //                       child: Container(
        //                         width: double.infinity,
        //                         padding: EdgeInsets.symmetric(vertical: 16),
        //                         alignment: Alignment.center,
        //                         decoration: BoxDecoration(
        //                           color: Theme.of(context).primaryColor,
        //                           borderRadius: BorderRadius.circular(8),
        //                         ),
        //                         child: Text(
        //                           'Login',
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 16,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
