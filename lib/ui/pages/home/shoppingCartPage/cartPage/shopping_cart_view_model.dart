import 'package:flutter/material.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

class ShopingCartViewModel extends ChangeNotifier {
  int amountOfGoods = Json.cartGoods.length;
  int summOfGoods = 0;
  int discountFromCard = 0;
  int deliveryPrice = 199;
  late int totalPrice = deliveryPrice + discountFromCard + summOfGoods;

  int summOfAllGoods() {
    for (var element in Json.cartGoods) {
      summOfGoods += element.priceGoods;
    }
    return summOfGoods;
  }

  void clearAllGoods() {
    Json.cartGoods.clear();
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
