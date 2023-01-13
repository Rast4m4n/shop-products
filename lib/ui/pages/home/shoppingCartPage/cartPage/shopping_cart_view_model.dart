import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_products/data/repository/shared_pref_repository.dart';
import 'package:shop_products/domain/models/cart_model.dart';
import 'package:shop_products/domain/models/user_model.dart';
import 'package:shop_products/ui/navigator/app_navigation.dart';

class ShopingCartViewModel extends ChangeNotifier {
  ShopingCartViewModel({required this.cartGoods});

  final CartModel cartGoods;
  bool isWriteOff = false;

  void updateCart() {
    notifyListeners();
  }

  void clearAllGoods() {
    CartModel.cartGoods.clear();
    notifyListeners();
  }

  ///Списать баллы
  void writeOffPoint() {
    isWriteOff = true;
    notifyListeners();
  }

  ///Накапливать баллы
  void accumulatePoints() {
    isWriteOff = false;
    notifyListeners();
  }

  static void enterToOrderGoods(BuildContext context) {
    Navigator.of(context).pushNamed(AppRouteNames.main);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Заказ оформлен! Ждите звонка от курьера',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
    CartModel.cartGoods.clear();
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
  }) : super(key: key, notifier: model);

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
