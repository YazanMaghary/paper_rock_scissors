import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:paper_rock_scissors_game/controller/home_page_controller.dart';
import 'package:paper_rock_scissors_game/core/utils/appConstances.dart';

import '../../core/utils/appStrings.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageController _homePageController = Get.put(HomePageController());
  final Appstrings appStrings = Appstrings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appStrings.title.tr,
          style: Theme.of(context).primaryTextTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
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
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    // gibe it rotation only
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/paper.png",
                          width: 50.r,
                          height: 50.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/R.png",
                              width: 50.r,
                              height: 50.r,
                            ),
                            Image.asset(
                              "assets/images/scissors.png",
                              width: 50.r,
                              height: 50.r,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              largeSpace,
              GetBuilder<HomePageController>(
                builder: (controller) {
                  return Container(
                    alignment: Alignment.center,
                    child: Wrap(children: controller.icons2),
                  );
                },
              ),
              largeSpace,
              MatchWidget(),
              largeSpace,
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.r,
                      height: 100.r,
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          print(_homePageController.icons2.length);

                          if (_homePageController.icons2.length > 10) {
                          } else {
                            _homePageController.chooseCard(0);
                          }
                        },
                        child: Image.asset("assets/images/paper.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    xsmallSpace,
                    SizedBox(
                      width: 100.r,
                      height: 100.r,
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (_homePageController.icons2.length > 10) {
                          } else {
                            _homePageController.chooseCard(1);
                          }
                        },
                        child: Image.asset("assets/images/R.png"),
                      ),
                    ),
                    xsmallSpace,
                    SizedBox(
                      width: 100.r,
                      height: 100.r,
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        onTap: () {
                  
                          if (_homePageController.icons2.length > 10) {
                          } else {
                            _homePageController.chooseCard(2);
                          }
                        },
                        child: Image.asset("assets/images/scissors.png"),
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
  }
}

class MatchWidget extends StatelessWidget {
  MatchWidget({super.key});
  final Appstrings appStrings = Appstrings();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                GetBuilder<HomePageController>(
                  builder: (controller) {
                    return AnimatedScale(
                      scale: controller.isPlay ? 0.0 : 1,
                      duration: const Duration(milliseconds: 250),
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 250),
                        turns: controller.turns,
                        child: Image.asset(
                          "assets/images/${controller.rand_choise}",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8.h),
                Text(
                  appStrings.you.tr,
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Text(
            appStrings.vs.tr,
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                GetBuilder<HomePageController>(
                  builder: (controller) {
                    return AnimatedScale(
                      duration: const Duration(milliseconds: 250),
                      scale: controller.isPlay ? 0 : 1,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 250),
                        turns: controller.turns,
                        child: Image.asset(
                          "assets/images/${controller.rand_choise2}",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8.h),
                Text(
                  appStrings.system.tr,
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
