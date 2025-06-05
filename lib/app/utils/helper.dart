import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

final String splashIcon = 'assets/icon/icon.png';
final box = GetStorage();
final kwhiteColor = const Color(0xFFFFFFFF);
final kblackColor = const Color(0xFF000000);
double kHeight = Get.mediaQuery.size.height;
double kWidth = Get.mediaQuery.size.width;
DateFormat datetimeFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
String convertDateToApiFormat(DateTime date) {
  return DateFormat('yyyy/MM/dd').format(date);
}
