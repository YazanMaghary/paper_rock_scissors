import "package:get/get.dart";
import "package:paper_rock_scissors_game/view/screens/Starter_page.dart";
import "package:paper_rock_scissors_game/view/screens/history_page.dart";
import "package:paper_rock_scissors_game/view/screens/home_page.dart";

List<GetPage> routes = [
  GetPage(
    name: "/starterPage",
    page: () =>  StarterPage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: "/homePage",
    page: () => HomePage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: "/historyPage",
    page: () => HistoryPage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 300),
  ),
];
