import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_test/controller/languageController.dart';
import 'package:getx_test/controller/themecontroller.dart';
import 'package:getx_test/language.dart';
import 'screen/homePage.dart';

void main() async {
  await GetStorage.init();
  final themeController = Get.put(ThemeController());
  final languageController = Get.put(LanguageController());
  runApp(GetMaterialApp(
      translations: Messages(),
      locale: languageController.lan,
      theme: themeController.theme,
      fallbackLocale: Locale('en', 'US'),
      home: MyHomePage()));
}
