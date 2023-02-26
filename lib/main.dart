import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_products/app.dart';
import 'package:shop_products/data/api/services/goods_api.dart';
import 'package:shop_products/data/api/services/mock_goods_api.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/data/repository/shared_pref_repository.dart';
import 'package:shop_products/domain/state/theme_switcher.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeSwitcher.instance;
  SharedPreferencesRepository.instance;
  ThemeSwitcher.isDark = await SharedPreferencesRepository.instance.loadTheme();
  final AppNavigation navigation = AppNavigation();
  dependencyInjection();
  runApp(MyApp(navigation: navigation));
}

void dependencyInjection() {
  final api = MockApi();
  // final api = GoodsApi();
  GetIt.I.registerSingleton(GoodsRepository(api));
}
