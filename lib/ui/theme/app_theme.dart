import 'package:flutter/material.dart';

abstract class AppFonts {
  static const String _titleFont = "DaysOne";
  static const String primaryFontMedium = "RobotoMedium"; //regular
  static const String primaryFontRegular = "RobotoRegular"; //medium
  static const String primaryFontBold = "RobotoBold";
}

abstract class AppColors {
  static const Color primaryPurple = Color(0xffBA68C8);
  static const Color secondaryYellow = Color(0xffFFD600);
  static const Color subStrate = Color(0x50C4D4FF);
  static const Color paymentGreen = Color(0xff2DBE64);
}

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      bodyMedium: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      bodySmall: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      headlineSmall: TextStyle(fontFamily: AppFonts.primaryFontBold),
      headlineMedium: TextStyle(fontFamily: AppFonts.primaryFontBold),
      headlineLarge: TextStyle(fontFamily: AppFonts.primaryFontBold),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: AppColors.secondaryYellow,
          fontFamily: AppFonts._titleFont,
          fontSize: 24),
      color: AppColors.primaryPurple,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryPurple,
      selectedIconTheme: IconThemeData(size: 18),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      textStyle: TextStyle(color: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.subStrate.withOpacity(0.2);
            }
            return null;
          },
        ),
      ),
    ),
  );
  //-------------------Тёмная тема----------------------
  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      bodyMedium: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      bodySmall: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      headlineSmall: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      headlineMedium: TextStyle(fontFamily: AppFonts.primaryFontMedium),
      headlineLarge: TextStyle(fontFamily: AppFonts.primaryFontMedium),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.secondaryYellow,
        fontFamily: AppFonts._titleFont,
        fontSize: 24,
      ),
      color: AppColors.primaryPurple,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryPurple,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      textStyle: TextStyle(color: Colors.white),
    ),
  );
}
