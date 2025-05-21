import 'package:get/get.dart';
import 'package:paper_rock_scissors_game/core/utils/appStrings.dart';

class Apptranstion extends Translations {
  final Appstrings appString = Appstrings();
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      appString.title: 'Paper Rock Scissors',
      appString.play: 'Play with your System',
      appString.you: 'You',
      appString.system: 'System',
      appString.vs: 'VS',
      appString.playAgain: 'Play Again',
      appString.drawer: 'Drawer',
      appString.result: 'Result',
      appString.points: 'Points',
      appString.winner: 'Winner',
      appString.looser: 'Looser',
      appString.date: 'Date',
      appString.gameResult: 'Game Result!',
      appString.history: 'History',
      appString.settings: 'Settings',
      appString.arabic: 'ar',
    },
    "ar": {
      appString.title: 'لعبة ورقة صخرة مقص',
      appString.play: 'العب مع نظامك',
      appString.you: 'أنت',
      appString.system: 'نظام',
      appString.vs: 'ضد',
      appString.playAgain: 'العب مرة أخرى',
      appString.drawer: 'تعادل',
      appString.result: 'نتيجة',
      appString.points: 'نقاط',
      appString.winner: 'فائز',
      appString.looser: 'خاسر',
      appString.date: 'تاريخ',
      appString.gameResult: 'نتيجة اللعبة!',
      appString.history: 'السجل',
      appString.settings: 'الإعدادات',
      appString.arabic: 'en',
    },
  };
}
