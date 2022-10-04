import 'package:flutter/material.dart';
import 'package:shop_products/ui/pages/home/home_page.dart';
import 'package:shop_products/ui/pages/profile_page.dart';

abstract class AppRoute {
  static const main = '/';
  static const profile = '/profile';
}

class AppNavigation {
  String get initialRoute => AppRoute.main;

  Map<String, Widget Function(BuildContext context)> get routes => {
        AppRoute.main: (context) => const HomePage(),
        AppRoute.profile: (context) => const ProfilePage(),
      };
}
