import 'package:flutter/material.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class GoodsViewModel extends ChangeNotifier {
  GoodsViewModel({
    required GoodsRepository goodsRepository,
  }) : _goodsRepository = goodsRepository {
    load();
  }

  final GoodsRepository _goodsRepository;

  int counter = 1;
  bool isAddedToCart = false;
  var listOfGoods = <GoodsModel>[];

  /// Метод добавление товара в избранные, находясь в корзине
  void toFavoriteGoodsInCart(GoodsModel goods) {
    if (Json.cartGoods.contains(goods)) {
      final index =
          Json.cartGoods.indexWhere((element) => goods.id == element.id);
      Json.cartGoods[index] =
          goods.copyWith(favoriteGoods: goods.favoriteGoods ? false : true);
    } else {
      return;
    }
  }

  // добавление товара в избранные
  Future<void> toFavoriteGoods(GoodsModel goods) async {
    goods.favoriteGoods
        ? await _goodsRepository.removeFavoriteGoods(goods)
        : await _goodsRepository.addToFavoriteOneGoods(goods);
    toFavoriteGoodsInCart(goods);
    await load();
  }

  Future<void> load() async {
    listOfGoods = await _goodsRepository.fetchData();
    notifyListeners();
  }

  void addToCart(GoodsModel goods) {
    isAddedToCart = true;
    Json.cartGoods.add(goods);
  }

  void incrementGoods(GoodsModel goods) {
    Json.cartGoods.add(goods);
    counter += 1;
    notifyListeners();
  }

  void decrementGoods() {
    if (counter > 1) {
      counter -= 1;
      Json.cartGoods.removeLast();
    } else {
      if (Json.cartGoods.isNotEmpty) {
        Json.cartGoods.removeLast();
        isAddedToCart = false;
      } else {
        return;
      }
    }
    notifyListeners();
  }

  void deleteGoodsFromCart(GoodsModel goods) {
    Json.cartGoods.removeWhere((element) => element.id == goods.id);
    notifyListeners();
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
