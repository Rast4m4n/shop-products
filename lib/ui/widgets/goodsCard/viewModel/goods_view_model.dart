import 'package:flutter/material.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class GoodsViewModel extends ChangeNotifier {
  GoodsViewModel() {
    load();
  }

  int counter = 1;
  bool isAddedToCart = false;
  var listOfGoods = <GoodsModel>[];
  static final cartOfGoods = <GoodsModel>[];

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

  void addToCart(GoodsModel goods) {
    isAddedToCart = true;
    cartOfGoods.add(goods);
    print(cartOfGoods);
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

class GoodsInheritViewModel extends InheritedNotifier<GoodsViewModel> {
  final GoodsViewModel? model;
  const GoodsInheritViewModel({
    Key? key,
    required this.model,
    required super.child,
  }) : super(
          key: key,
          notifier: model,
        );
  static GoodsInheritViewModel? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GoodsInheritViewModel>();
  }

  static GoodsInheritViewModel? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GoodsInheritViewModel>()
        ?.widget;
    return widget is GoodsInheritViewModel ? widget : null;
  }
}
