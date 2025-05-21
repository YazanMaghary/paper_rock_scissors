import 'package:flutter/material.dart';
import 'package:paper_rock_scissors_game/core/utils/appConstances.dart';

class Themes {
  static final lightTheme = ThemeData(
    primaryColor: const Color(0xff5c6bc0),
    scaffoldBackgroundColor: Color(0xff5c6bc0),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff5c6bc0),
      secondary: Colors.white,
    ),
    cardColor: Colors.white54,
    useMaterial3: true,
    primaryTextTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.black,
      ),

      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      bodyLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: const Color(0xff1a237e),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff1a237e),
      secondary: Colors.black,
    ),
    scaffoldBackgroundColor: scaffoldBackgroundBlack,
    cardColor: Colors.black54,
    primaryTextTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      bodyLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
