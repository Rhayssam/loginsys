import 'package:flutter/material.dart';

class LoginsysUI {
  LoginsysUI._();
  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xFFA000E0),
    primaryColorDark: const Color(0xFF00343F),
    fontFamily: 'Roboto',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9C27B0),
        textStyle: const TextStyle(fontFamily: 'Roboto'),
      ),
    ),
  );
  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
