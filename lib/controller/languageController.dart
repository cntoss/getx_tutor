import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final box = GetStorage();
  bool get isNepali => box.read('isNepali') ?? false;
  Locale get lan => isNepali ? Locale('ne', 'NP') : Locale('en', 'US');
  void changeLnguage(bool val) => box.write('isNepali', val);
}
 