import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xffBA68C8);
  static const Color appBarTitle = Color(0xffFFD600);
}

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: AppColors.appBarTitle, fontFamily: 'DaysOne', fontSize: 24),
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(size: 18),
    ),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: AppColors.appBarTitle, fontFamily: 'DaysOne', fontSize: 24),
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
    ),
  );
}
