import 'package:flutter/material.dart';
import 'package:shop_products/ui/home/home_page.dart';

abstract class AppRoute {
  static const main = '/';
}

class AppNavigation {
  String get initialRoute => AppRoute.main;

  Map<String, Widget Function(BuildContext context)> get routes =>
      {AppRoute.main: (context) => const HomePage()};
}
