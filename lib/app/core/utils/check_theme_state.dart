import 'package:flutter/material.dart';

class AppThemeSystemCheck
{

  bool effectiveIsDark(BuildContext context, ThemeMode mode) {
    final systemDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    switch (mode) {
      case ThemeMode.dark: return true;
      case ThemeMode.light: return false;
      case ThemeMode.system: return systemDark;
    }
  }

}

