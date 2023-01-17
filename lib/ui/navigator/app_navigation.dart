import 'package:flutter/material.dart';
import 'package:shop_products/ui/pages/home/favoriteGoodsPage/favorite_goods_page.dart';
import 'package:shop_products/ui/pages/home/mainShopPage/main_shop_page.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/cartPage/shopping_cart_view.dart';

abstract class AppRouteNames {
  static const main = '/';
  static const shopingCart = '/shopingCart';
  static const favoriteGoods = '/favoriteGoods';
}

class AppNavigation {
  String get initialRoute => AppRouteNames.main;

  Map<String, Widget Function(BuildContext context)> get routes => {
        AppRouteNames.shopingCart: (context) => ShoppingCartPage(),
        AppRouteNames.favoriteGoods: (context) => const FavoriteGoodsPage(),
      };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var goodsName = '';
    if (settings.arguments != null) {
      goodsName = settings.arguments as String;
    }
    if (settings.name!.startsWith(AppRouteNames.main)) {
      return MaterialPageRoute(
        builder: (context) {
          return MainShopPage(searchFiltred: goodsName);
        },
      );
    }
    return null;
  }
}
