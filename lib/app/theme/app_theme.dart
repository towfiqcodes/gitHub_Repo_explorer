import 'package:flutter/material.dart';

class AppThemeData {
  // Use Nice, modern themes
  final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFF4F46E5), // indigo-ish
    cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    )),
  );

  final darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: const Color(0xFF4F46E5),
      cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      )));
}
