import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xffff4d4d);
}

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontFamily: 'RoundsBlack', fontSize: 24),
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(size: 18),
    ),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontFamily: 'RoundsBlack', fontSize: 24),
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
    ),
  );
}
