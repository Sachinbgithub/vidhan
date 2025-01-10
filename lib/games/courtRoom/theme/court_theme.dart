// theme/court_theme.dart
import 'package:flutter/material.dart';

class CourtTheme {
  static ThemeData get theme => ThemeData(
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: Colors.grey[50],
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.brown[700],
      elevation: 0,
      centerTitle: true,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0, color: Colors.white),
      ),
    ),
  );
}