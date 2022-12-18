import 'package:flutter/material.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

class ShopingCartViewModel extends ChangeNotifier {
  ShopingCartViewModel() {
    _counterGoods();
  }
  int _amountOfGoods = 0;
  int _summOfGoods = 0;
  int discountCard = 0;
  int deliveryPrice = 199;
  int _totalPrice = 0;

  Map<GoodsModel, int> listOfGoods = {};

  void _counterGoods() {
    for (final goods in Json.cartGoods) {
      if (listOfGoods.containsKey(goods)) {
        listOfGoods[goods] = listOfGoods[goods]! + 1;
      } else {
        listOfGoods[goods] = 1;
      }
    }
    listOfGoods.keys.toList().sort((e, b) => e.id.compareTo(b.id));
  }

  void updateCart() {
    notifyListeners();
  }

  int summOfAllGoods() {
    for (var element in Json.cartGoods) {
      _summOfGoods += element.priceGoods;
    }
    return _summOfGoods;
  }

  int amountOfGoodsFunc() {
    _amountOfGoods = Json.cartGoods.length;
    return _amountOfGoods;
  }

  void clearAllGoods() {
    Json.cartGoods.clear();
    listOfGoods.clear();
    _totalPrice = 0;
    _summOfGoods = 0;
    notifyListeners();
  }

  int totalPriceFunc() {
    _totalPrice = deliveryPrice + _summOfGoods - discountCard;
    return _totalPrice;
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
