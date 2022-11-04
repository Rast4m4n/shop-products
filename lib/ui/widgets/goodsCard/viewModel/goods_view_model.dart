import 'package:flutter/material.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/data/mappers/user_model_mapper.dart';
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

  Future<void> toFavoriteGoods(GoodsModel goods) async {
    goods.favoriteGoods
        ? await _goodsRepository.removeFavoriteGoods(goods)
        : await _goodsRepository.addToFavoriteOneGoods(goods);
    await load();
  }

  Future<void> load() async {
    listOfGoods = await _goodsRepository.fetchData();
    notifyListeners();
  }

  void addToCart(GoodsModel goods) {
    isAddedToCart = true;
    Json.cartGoods.add(goods);
    print(Json.cartGoods);
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
    final widget = context.getElementForInheritedWidgetOfExactType<GoodsInheritViewModel>()?.widget;
    return widget is GoodsInheritViewModel ? widget : null;
  }
}