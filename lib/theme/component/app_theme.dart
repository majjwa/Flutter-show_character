import 'package:flutter/material.dart';

class AppTheme {
  static final appThemeData = {
    Themes.lightTheme: ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: Colors.purple.shade100,
        secondary: Colors.black,
      ),
      dividerColor: Colors.grey,
    ),
    Themes.darkTheme: ThemeData(
      appBarTheme: AppBarTheme(
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
