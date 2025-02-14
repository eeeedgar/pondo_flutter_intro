import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF9381FF),
  scaffoldBackgroundColor: Color(0xFF1A1A2E),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF9381FF),
    secondary: Color(0xFFB8B8FF),
    surface: Color(0xFF1A1A2E),
    error: Colors.redAccent,
    onPrimary: Color(0xFFF8F7FF),
    onSecondary: Color(0xFFF8F7FF),
    onSurface: Color(0xFFF8F7FF),
    onError: Color(0xFFF8F7FF),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF9381FF),
    foregroundColor: Color(0xFFF8F7FF),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFB8B8FF),
    foregroundColor: Color(0xFF1A1A2E),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF9381FF),
      foregroundColor: Color(0xFFF8F7FF),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Color(0xFFB8B8FF),
      side: BorderSide(color: Color(0xFFB8B8FF)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFFB8B8FF),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1A1A2E),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF9381FF), width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFB8B8FF), width: 1),
    ),
  ),
);