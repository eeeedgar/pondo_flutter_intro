import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFF8F7FF),
  scaffoldBackgroundColor: Color(0xFFF8F7FF),
  colorScheme: ColorScheme.light(
    primary: Color(0xFFF8F7FF),
    secondary: Color(0xFFB8B8FF),
    surface: Color(0xFFF8F7FF),
    error: Colors.redAccent,
    onPrimary: Color(0xFF1A1A2E),
    onSecondary: Color(0xFF1A1A2E),
    onSurface: Color(0xFF1A1A2E),
    onError: Color(0xFFF8F7FF),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFB8B8FF),
    foregroundColor: Color(0xFF1A1A2E),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF9381FF),
    foregroundColor: Color(0xFFF8F7FF),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF9381FF),
      foregroundColor: Color(0xFFF8F7FF),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Color(0xFF9381FF),
      side: BorderSide(color: Color(0xFF9381FF)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFF9381FF),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF8F7FF),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF9381FF), width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFB8B8FF), width: 1),
    ),
  ),
);
