import 'package:flutter/material.dart';
import 'package:shop_products/ui/pages/home/favoriteGoodsPage/favorite_goods_page.dart';
import 'package:shop_products/ui/pages/home/mainShopPage/main_shop_page.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/cartPage/shopping_cart_view.dart';

abstract class AppRouteNames {
  static const home = '/';
  // static const profile = '/profile';
  static const shopingCart = '/shopingCart';
  static const favoriteGoods = '/favoriteGoods';
}

class AppNavigation {
  String get initialRoute => AppRouteNames.home;

  Map<String, Widget Function(BuildContext context)> get routes => {
        AppRouteNames.home: (context) => const MainShopPage(),
        // AppRouteNames.profile: (context) => ProfilePage(),
        AppRouteNames.shopingCart: (context) => ShoppingCartPage(),
        AppRouteNames.favoriteGoods: (context) => const FavoriteGoodsPage(),
      };
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final goods = settings.arguments as String;
    if (settings.name!.startsWith(AppRouteNames.home)) {
      return MaterialPageRoute(builder: (context) {
        return const MainShopPage();
      });
    }
  }
}
