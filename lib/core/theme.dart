import 'package:flutter/material.dart';

class AxonTheme {
  static const Color background = Color(0xFF070B11);
  static const Color cardBg = Color(0x14FFFFFF);
  static const Color borderStroke = Color(0x14FFFFFF);
  static const Color cyanAccent = Color(0xFF00D2FF);
  static const Color blueGlow = Color(0xFF3B82F6);
  static const Color neonGreen = Color(0xFF00FF66);
  static const Color textMuted = Color(0xFF8E9BAE);

  static final BoxDecoration glassCardDecoration = BoxDecoration(
    color: cardBg,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: borderStroke, width: 1.2),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: background,
    primaryColor: cyanAccent,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: cyanAccent,
      secondary: blueGlow,
      surface: background,
      background: background,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
  );
}
