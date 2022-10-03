import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xffBA68C8);
  static const Color appBarTitle = Color(0xffFFD600);
  static const Color subStrate = Color(0x50C4D4FF);
}

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: "Roboto"),
      bodyMedium: TextStyle(fontFamily: "Roboto"),
      bodySmall: TextStyle(fontFamily: "Roboto"),
      headlineSmall: TextStyle(fontFamily: "Roboto"),
      headlineMedium: TextStyle(fontFamily: "Roboto"),
      headlineLarge: TextStyle(fontFamily: "Roboto"),
    ),
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
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: "Roboto"),
      bodyMedium: TextStyle(fontFamily: "Roboto"),
      bodySmall: TextStyle(fontFamily: "Roboto"),
      headlineSmall: TextStyle(fontFamily: "Roboto"),
      headlineMedium: TextStyle(fontFamily: "Roboto"),
      headlineLarge: TextStyle(fontFamily: "Roboto"),
    ),
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
