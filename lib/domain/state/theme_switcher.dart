import 'package:flutter/material.dart';
import 'package:shop_products/data/repository/shared_pref_repository.dart';
import 'package:shop_products/ui/theme/app_theme.dart';

class ThemeSwitcher extends ChangeNotifier {
  ThemeSwitcher._internal();
  static final ThemeSwitcher _singleton = ThemeSwitcher._internal();
  static ThemeSwitcher get instance => _singleton;

  static bool isDark = false;

  ThemeData currentTheme() {
    return isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  bool switchTheme() {
    isDark = !isDark;
    SharedPreferencesRepository.instance.saveTheme(isDark).then(
          (value) => notifyListeners(),
        );
    return isDark;
  }
}
