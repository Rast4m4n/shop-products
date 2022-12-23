import 'package:flutter/material.dart';
import 'package:shop_products/ui/pages/home/favoriteGoodsPage/favorite_goods_page.dart';
import 'package:shop_products/ui/pages/home/home_page.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/cartPage/shopping_cart_view.dart';
import 'package:shop_products/ui/pages/home/shoppingCartPage/orderPage/order_goods_view.dart';
import 'package:shop_products/ui/pages/profilePage/profile_page.dart';

abstract class AppRouteNames {
  static const main = '/';
  static const profile = '/profile';
  static const shopingCart = '/shopingCart';
  static const orderGoods = '/OrderGoods';
  static const favoriteGoods = '/favoriteGoods';
}

class AppNavigation {
  String get initialRoute => AppRouteNames.main;

  Map<String, Widget Function(BuildContext context)> get routes => {
        AppRouteNames.main: (context) => const HomePage(),
        AppRouteNames.profile: (context) => ProfilePage(),
        AppRouteNames.shopingCart: (context) => ShoppingCartPage(),
        AppRouteNames.orderGoods: (context) => const OrderingGoodsView(),
        AppRouteNames.favoriteGoods: (context) => const FavoriteGoodsPage(),
      };
}
