import 'package:flutter/material.dart';
import 'package:shop_products/ui/pages/home/home_page.dart';
import 'package:shop_products/ui/pages/profilePage/profile_page.dart';

abstract class AppRouteNames {
  static const main = '/';
  static const profile = '/profile';
}

class AppNavigation {
  String get initialRoute => AppRouteNames.main;

  Map<String, Widget Function(BuildContext context)> get routes => {
        AppRouteNames.main: (context) => const HomePage(),
        AppRouteNames.profile: (context) => ProfilePage(),
      };
}
