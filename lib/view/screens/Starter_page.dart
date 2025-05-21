import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paper_rock_scissors_game/controller/starter_page_controller.dart';
import 'package:paper_rock_scissors_game/controller/theme_controller.dart';
import 'package:paper_rock_scissors_game/core/utils/appStrings.dart';

class StarterPage extends GetView {
  StarterPage({super.key});
  final Appstrings appStrings = Appstrings();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(), // Initialize the ThemeController
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: Alignment.topCenter,
                  stops: [0.1, 1],
                  end: Alignment.bottomCenter,
                  transform: GradientRotation(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<StarterPageController>(
                          init: StarterPageController(),
                          builder: (controller2) {
                            return TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0),
                              ),
                              onPressed: () {
                                controller2.changeLanguage();
                              },
                              child: Text(
                                appStrings.arabic.tr,
                                style:
                                    Theme.of(
                                      context,
                                    ).primaryTextTheme.titleSmall,
                              ),
                            );
                          },
                        ),
                        Text(
                          appStrings.title.tr,
                          style: Theme.of(context).primaryTextTheme.titleSmall,
                        ),

                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (
                            Widget child,
                            Animation<double> animation,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: IconButton(
                            key: ValueKey(controller.themeIcon.icon),
                            icon: controller.themeIcon,
                            onPressed: () {
                              controller.changesTheme();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Container(
                    width: 350.w,
                    height: 500.h,
                    color: Theme.of(context).cardColor,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed("/homePage");
                          },
                          child: Container(
                            width: 270.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 32.w,
                            ),
                            child: Text(
                              appStrings.play.tr,
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/historyPage");
                          },
                          child: Container(
                            width: 270.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 32.w,
                            ),
                            child: Text(
                              appStrings.history.tr,
                              style:
                                  Theme.of(context).primaryTextTheme.bodySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
