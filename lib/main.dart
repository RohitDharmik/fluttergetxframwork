import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/utils/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      title: 'Flutter GetX MVC Starter',
      theme: AppTheme.lightTheme,

      themeMode: ThemeMode.light,
      // darkTheme: ThemeMode.system,
      // darkTheme: AppTheme.darkTheme,
    );
  }
}
