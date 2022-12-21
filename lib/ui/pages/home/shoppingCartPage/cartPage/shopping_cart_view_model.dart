import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/cart_model.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

class ShopingCartViewModel extends ChangeNotifier {
  ShopingCartViewModel({required this.cartGoods});

  final CartModel cartGoods;

  void updateCart() {
    notifyListeners();
  }

  void clearAllGoods() {
    CartModel.cartGoods.clear();
    notifyListeners();
  }

  static void enterToOrderGoods(BuildContext context) {
    Navigator.of(context).pushNamed(AppRouteNames.orderGoods);
  }

  static void enterToMainShop(BuildContext context) {
    Navigator.of(context).pushNamed(AppRouteNames.main);
  }
}

class ShopingCartProvider extends InheritedNotifier<ShopingCartViewModel> {
  final ShopingCartViewModel? model;
  const ShopingCartProvider({
    Key? key,
    required this.model,
    required super.child,
  }) : super(
          key: key,
          notifier: model,
        );
  static ShopingCartProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShopingCartProvider>();
  }

  static ShopingCartProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ShopingCartProvider>()
        ?.widget;
    return widget is ShopingCartProvider ? widget : null;
  }
}
