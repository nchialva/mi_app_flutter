import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6C63FF), // Un púrpura moderno
        primary: const Color(0xFF6C63FF),
        secondary: const Color(0xFFFF6584), // Rosa vibrante para acentos
      ),
      scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF6C63FF),
        elevation: 2,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xFF6C63FF),
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        iconTheme: IconThemeData(color: Color(0xFF6C63FF)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6C63FF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          elevation: 4,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF6584),
        elevation: 6,
      ),
      textTheme: base.textTheme.copyWith(
        headlineLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Color(0xFF3E3E3E),
        ),
        bodyLarge: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
        bodyMedium: const TextStyle(fontSize: 14, color: Color(0xFF9E9E9E)),
        labelLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 2),
        ),
        hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: const Color(0xFF6C63FF)),
      ),
      useMaterial3: true,
    );
  }
}
