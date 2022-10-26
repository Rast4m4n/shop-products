import 'package:flutter/material.dart';
import 'package:shop_products/app.dart';
import 'package:shop_products/data/repository/shared_pref_repository.dart';
import 'package:shop_products/domain/state/theme_switcher.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeSwitcher.instance;
  SharedPreferencesRepository.instance;
  ThemeSwitcher.isDark = await SharedPreferencesRepository.instance.loadTheme();
  final AppNavigation navigation = AppNavigation();
  runApp(MyApp(navigation: navigation));
}
