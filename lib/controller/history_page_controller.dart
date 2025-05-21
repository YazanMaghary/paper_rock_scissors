import 'package:get/get.dart';

import '../core/utils/appConstances.dart';

class HistoryPageController extends GetxController {
  clearHistory() {
    boxHistory.clear();
    update();
  }
}
