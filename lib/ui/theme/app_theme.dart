import 'package:flutter/material.dart';

abstract class AppFonts {
  static const String _titleFont = "DaysOne";
  static const String primaryFont = "RobotoMedium"; //regular
  static const String primaryFontRegular = "RobotoRegular"; //medium
  static const String primaryFontBold = "RobotoBold";
}

abstract class AppColors {
  static const Color primaryColor = Color(0xffBA68C8);
  static const Color appBarTitle = Color(0xffFFD600);
  static const Color subStrate = Color(0x50C4D4FF);
}

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: AppFonts.primaryFont),
      bodyMedium: TextStyle(fontFamily: AppFonts.primaryFont),
      bodySmall: TextStyle(fontFamily: AppFonts.primaryFont),
      headlineSmall: TextStyle(fontFamily: AppFonts.primaryFontBold),
      headlineMedium: TextStyle(fontFamily: AppFonts.primaryFontBold),
      headlineLarge: TextStyle(fontFamily: AppFonts.primaryFontBold),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: AppColors.appBarTitle,
          fontFamily: AppFonts._titleFont,
          fontSize: 24),
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(size: 18),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      textStyle: TextStyle(color: Colors.black),
    ),
  );
  //-------------------Тёмная тема----------------------
  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: AppFonts.primaryFont),
      bodyMedium: TextStyle(fontFamily: AppFonts.primaryFont),
      bodySmall: TextStyle(fontFamily: AppFonts.primaryFont),
      headlineSmall: TextStyle(fontFamily: AppFonts.primaryFont),
      headlineMedium: TextStyle(fontFamily: AppFonts.primaryFont),
      headlineLarge: TextStyle(fontFamily: AppFonts.primaryFont),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.appBarTitle,
        fontFamily: AppFonts._titleFont,
        fontSize: 24,
      ),
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      textStyle: TextStyle(color: Colors.white),
    ),
  );
}