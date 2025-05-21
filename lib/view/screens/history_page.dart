import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:paper_rock_scissors_game/core/utils/appConstances.dart';
import 'package:paper_rock_scissors_game/core/utils/appStrings.dart';

import '../../controller/history_page_controller.dart';

class HistoryPage extends GetView {
  HistoryPage({super.key});
  final Appstrings _appString = Appstrings();
  final HistoryPageController _historyController = Get.put(
    HistoryPageController(),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,

          title: Text(
            _appString.history.tr,
            style: Theme.of(context).primaryTextTheme.titleMedium,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
        IconButton(onPressed: () {
                _historyController.clearHistory();
                }, icon: const Icon(Icons.clear))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.topCenter,
              stops: const [0.1, 1],
              end: Alignment.bottomCenter,
              transform: const GradientRotation(0.3),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      _appString.result.tr,
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                    Text(
                      _appString.result.tr,
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _appString.date.tr,
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                  ],
                ),
                mediumSpace,
                GetBuilder<HistoryPageController>(init: _historyController,
                  builder: (controller) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: boxHistory.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${boxHistory.getAt(index)["Result"]}",
                                  style:
                                      Theme.of(context).primaryTextTheme.bodySmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 36.w),
                                  child: Text(
                                    boxHistory.getAt(index)["Points"],
                                    style:
                                        Theme.of(
                                          context,
                                        ).primaryTextTheme.bodySmall,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    "${DateFormat().add_jm().format(DateTime.parse(boxHistory.getAt(index)["Date"]))}\t${DateFormat().add_yMMMMEEEEd().format(DateTime.parse(boxHistory.getAt(index)["Date"]))}",
                                    style:
                                        Theme.of(
                                          context,
                                        ).primaryTextTheme.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(color: Colors.white, thickness: 1);
                        },
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
