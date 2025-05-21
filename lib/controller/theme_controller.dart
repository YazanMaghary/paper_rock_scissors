import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_rock_scissors_game/core/utils/appConstances.dart';

class ThemeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ThemeMode themeMode =
      box.get("isDark") == null || box.get("isDark") == false
          ? ThemeMode.light
          : ThemeMode.dark;
  Icon themeIcon =
      box.get("isDark") == null || box.get("isDark") == false
          ? const Icon(Icons.dark_mode, color: Colors.black)
          : const Icon(Icons.light_mode, color: Colors.white);
  bool? isDark =
      box.get("isDark") == null || box.get("isDark") == false ? false : true;

  // Default color for light theme
  // Track current theme
  Gradient? _gradient;
  Gradient get gradient => _gradient!;
  set gradient(Gradient value) {
    _gradient = value;
  }

  @override
  onInit() {
    super.onInit();
    box.put("isDark", box.get("isDark") ?? false);
    // Check the saved theme preference
    // changesTheme();
  }

  void changesTheme() {
    if (isDark == false) {
      themeMode = ThemeMode.dark;
      Get.changeThemeMode(ThemeMode.dark);
      darkTheme();
      themeIcon = const Icon(Icons.light_mode, color: Colors.white);
      isDark = true;
      box.put("isDark", isDark);
      print("Is Dark :${isDark}");
      print("Is Dark get :${box.get("isDark")}");

      update();
    } else {
      themeMode = ThemeMode.light;
      Get.changeThemeMode(ThemeMode.light);
      lightTheme();
      themeIcon = const Icon(Icons.dark_mode, color: Colors.black);

      isDark = false;
      box.put("isDark", isDark);
      print("Is Dark :${isDark}");
      print("Is Darkg get :${box.get("isDark")}");

      update();
    }
  }

  Gradient darkTheme() {
    gradient = LinearGradient(
      colors: [const Color(0xff1a237e), Colors.black],
      begin: Alignment.topCenter,
      stops: [0.1, 1],
      end: Alignment.bottomCenter,
      transform: GradientRotation(0.3),
    );
    update();
    return _gradient!;
  }

  Gradient lightTheme() {
    gradient = LinearGradient(
      colors: [const Color(0xff5c6bc0), Colors.white],
      begin: Alignment.topCenter,
      stops: [0.1, 1],
      end: Alignment.bottomCenter,
      transform: GradientRotation(0.3),
    );
    update();
    return _gradient!;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
