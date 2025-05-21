import 'dart:async';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_rock_scissors_game/core/utils/appStrings.dart';

import '../core/utils/appConstances.dart';

class HomePageController extends GetxController {
  late final List _rand = ["paper.png", "R.png", "scissors.png"];
  late String _rand_choise = _rand[0];
  late String _rand_choise2 = _rand[1];
  final Appstrings appstrings = Appstrings();
  final List<Icon> _icons2 = [];
  int _counterWin = 0;
  int _counterLose = 0;
  bool _isPlay = false;
  double _turns = 0;
  bool _dialogShown = false;

  // Getters
  List get rand => _rand;
  String get rand_choise => _rand_choise;
  String get rand_choise2 => _rand_choise2;
  List<Icon> get icons2 => _icons2;
  int get counterWin => _counterWin;
  int get counterLose => _counterLose;
  bool get isPlay => _isPlay;
  double get turns => _turns;

  // Setters
  set rand_choise(String value) {
    _rand_choise = value;
  }

  set rand_choise2(String value) {
    _rand_choise2 = value;
  }

  set counterWin(int value) {
    _counterWin = value;
  }

  set counterLose(int value) {
    _counterLose = value;
  }

  set isPlay(bool value) {
    _isPlay = value;
  }

  set turns(double value) {
    _turns = value;
  }

  void chooseCard(int randChoise) {
    isPlay = true;
    turns += 1;
    if (icons2.length > 10) {
      print("Game Over");
    } else {
      Timer(const Duration(milliseconds: 250), () {
        _random();
        rand_choise = rand[randChoise];
        isPlay = false;
        turns = 0;
      });
    }
    update();
  }

  Icon? _random() {
    if (_icons2.length >= 10 && !_dialogShown) {
      _dialogShown = true;
      boxHistory.add({
        "Result":
            _counterWin >= _counterLose
                ? _counterWin == _counterLose
                    ? appstrings.drawer
                    : appstrings.winner
                : appstrings.looser,
        "Points": "$_counterWin - $_counterLose",
        "Date" : DateTime.now().toString(),
      });
      AwesomeDialog(
        dismissOnTouchOutside: false,dialogBackgroundColor: Colors.white,
        context: Get.context!,
        dialogType:
            _counterWin > _counterLose ? DialogType.success : DialogType.error,
        animType: AnimType.scale,
        title: appstrings.gameResult.tr,
        desc:
            _counterWin > _counterLose
                ? "${appstrings.winner.tr} \n${appstrings.result.tr} $counterWin / $_counterLose"
                : "${appstrings.looser.tr} \n${appstrings.result.tr} $_counterWin / $_counterLose",
        descTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        btnOkOnPress: () {
          _icons2.clear();
          _counterLose = 0;
          _counterWin = 0;
          _dialogShown = false;
        },
      ).show();
    } else {
      if (isPlay) {
        _rand_choise2 = _rand[Random().nextInt(_rand.length)];
        if (_rand_choise == "paper.png" && _rand_choise2 == "R.png") {
          _counterWin++;
          _icons2.add(
            const Icon(Icons.thumb_up, size: 30, color: Colors.green),
          );
        } else if (_rand_choise == "paper.png" &&
            _rand_choise2 == "scissors.png") {
          _counterLose++;
          _icons2.add(
            const Icon(Icons.thumb_down, size: 30, color: Colors.red),
          );
        } else if (_rand_choise == "R.png" && _rand_choise2 == "paper.png") {
          _counterLose++;
          _icons2.add(
            const Icon(Icons.thumb_down, size: 30, color: Colors.red),
          );
        } else if (_rand_choise == "R.png" && _rand_choise2 == "scissors.png") {
          _counterWin++;
          _icons2.add(
            const Icon(Icons.thumb_up, size: 30, color: Colors.green),
          );
        } else if (_rand_choise == "scissors.png" &&
            _rand_choise2 == "paper.png") {
          _counterWin++;
          _icons2.add(
            const Icon(Icons.thumb_up, size: 30, color: Colors.green),
          );
        } else if (_rand_choise == "scissors.png" && _rand_choise2 == "R.png") {
          _counterLose++;
          _icons2.add(
            const Icon(Icons.thumb_down, size: 30, color: Colors.red),
          );
        } else {
          _icons2.add(
            const Icon(Icons.handshake, size: 30, color: Colors.yellow),
          );
        }
      } else {
        print("cant play");
      }
    }
    update();
    return null;
  }
}
