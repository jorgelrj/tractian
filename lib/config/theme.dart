import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData build() {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF17192D),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE0E0E0),
        thickness: 1,
      ),
      cardTheme: const CardTheme(
        color: Color(0xFF2188FF),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFFEAEFF3),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
