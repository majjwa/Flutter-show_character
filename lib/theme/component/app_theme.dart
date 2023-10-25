import 'package:flutter/material.dart';

class AppTheme {
  static final appThemeData = {
    Themes.lightTheme: ThemeData(
      cardColor: Colors.grey.shade200,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      dividerColor: Colors.grey,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: Colors.purple.shade100,
        secondary: Colors.black,


      ),
    ),
    Themes.darkTheme: ThemeData(

      cardColor: Colors.grey.shade600,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      dividerColor: Colors.grey.shade100,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: Colors.purple.shade800,
        secondary: Colors.white,



      ),
    ),
  };
}

enum Themes {
  lightTheme,
  darkTheme,
}
