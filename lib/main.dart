import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paper_rock_scissors_game/controller/theme_controller.dart';
import 'package:paper_rock_scissors_game/core/utils/appTranstion.dart';
import 'package:paper_rock_scissors_game/core/utils/themes.dart';
import 'package:get/get.dart';
import 'core/utils/appConstances.dart';
import 'core/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("theme");
  await Hive.openBox("history");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    print(boxHistory.values);
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return ScreenUtilInit(
          designSize: const Size(540, 960),
          ensureScreenSize: true,
          builder: (context, child) {
            return GetMaterialApp(
              initialRoute: "/starterPage",
              translations: Apptranstion(),
              locale: const Locale("en", "US"),
              debugShowCheckedModeBanner: false,
              theme: Themes.lightTheme,
              darkTheme: Themes.darkTheme,
              themeMode: box.get("isDark") ? ThemeMode.dark : ThemeMode.light,
              getPages: routes,
            );
          },
        );
      },
    );
  }
}
