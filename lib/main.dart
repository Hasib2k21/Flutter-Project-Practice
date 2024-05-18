import 'package:flutter/material.dart';
import 'package:practice/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _lightThemeData(),
      darkTheme: _darkThemeData(),
      themeMode: ThemeMode.system, // Automatically switch themes based on system settings
      home: CalculatorScreen(),
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  ThemeData _darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

