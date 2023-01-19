import 'package:flutter/material.dart';
import 'package:shop_products/domain/enums/category_enum.dart';
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
    var categoryGoods;
    if (settings.arguments != null) {
      if (settings.arguments is String) {
        goodsName = settings.arguments as String;
        if (settings.name == AppRouteNames.main) {
          return MaterialPageRoute(
            builder: (context) {
              return MainShopPage(searchFiltred: goodsName);
            },
          );
        }
      }
      if (settings.arguments is CategoryEnum) {
        categoryGoods = settings.arguments as CategoryEnum;
        if (settings.name == AppRouteNames.main) {
          return MaterialPageRoute(
            builder: (context) {
              return MainShopPage(category: categoryGoods);
            },
          );
        }
      }
    }

    return MaterialPageRoute(
      builder: (context) {
        return const MainShopPage();
      },
    );
  }
}
