import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarterPageController extends GetxController {
  void changeLanguage() {
    if (Get.locale?.languageCode == "en") {
      Get.updateLocale(const Locale("ar", "EG"));
    } else {
      Get.updateLocale(const Locale("en", "US"));
    }
    update();
  }
}
