import 'package:flutter/material.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class CardGoodsViewModel extends ChangeNotifier {
  CardGoodsViewModel() {
    load();
  }
  int counter = 1;
  bool isAddedToCart = false;
  var listOfGoods = <GoodsModel>[];

  Future<void> toFavoriteGoods(GoodsModel goods) async {
    final goodsRepo = MockApi();
    goods.favoriteGoods
        ? await goodsRepo.removeFavoriteGoods(goods)
        : await goodsRepo.addToFavoriteOneGoods(goods);
    await load();
  }

  Future<void> load() async {
    final goodsRepo = MockApi();
    listOfGoods = await goodsRepo.fetchData();
    notifyListeners();
  }

  void addToCart() {
    isAddedToCart = true;
  }

  void amountGoods(bool plus) {
    if (plus) {
      counter += 1;
    } else if (!plus) {
      if (counter > 1) {
        counter -= 1;
      } else {
        isAddedToCart = false;
      }
    }
  }
}

class CardGoodsInheritViewModel extends InheritedNotifier<CardGoodsViewModel> {
  final CardGoodsViewModel? model;
  const CardGoodsInheritViewModel({
    Key? key,
    required this.model,
    required super.child,
  }) : super(
          key: key,
          notifier: model,
        );
  static CardGoodsInheritViewModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CardGoodsInheritViewModel>();
  }

  static CardGoodsInheritViewModel? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CardGoodsInheritViewModel>()
        ?.widget;
    return widget is CardGoodsInheritViewModel ? widget : null;
  }
}
