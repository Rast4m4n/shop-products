import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shop_products/domain/models/goods_model.dart';

abstract class IApi {
  Future<List<GoodsModel>> fetchData();
}

class MockApi implements IApi {
  @override
  Future<List<GoodsModel>> fetchData() async {
    final String goodsJson =
        await rootBundle.loadString('assets/json/goods/goods.json');
    final goodsJsonData = jsonDecode(goodsJson) as List<dynamic>;
    return goodsJsonData
        .map((e) => GoodsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Future<void> saveGoods(GoodsModel goods, bool isFavorite) async {
  //   final listOfGoods = await fetchData();
  //   final index = listOfGoods.indexWhere((element) => element.id == goods.id);
  //   listOfGoods[index] = goods.copyWith(favoriteGoods: isFavorite);
  //   final goodsJson = listOfGoods.map((e) => e.toJson()).toList();
  //   final goodsJsonData = jsonEncode(goodsJson);
  // }

  Future<bool> addToFavoriteOneGoods(GoodsModel goods) async {
    print('Add Favorite goods ---------------');
    final listOfGoods = await fetchData();
    final index = listOfGoods.indexWhere((element) => element.id == goods.id);
    print('before return value ${listOfGoods[index].favoriteGoods}');
    listOfGoods[index] = goods.copyWith(favoriteGoods: true);
    print('return value ${listOfGoods[index].favoriteGoods}');
    return true;
  }

  Future<bool> removeFavoriteGoods(GoodsModel goods) async {
    print('Remove Favorite goods ---------------');
    final listOfGoods = await fetchData();
    final index = listOfGoods.indexWhere((element) => element.id == goods.id);
    print('before return value ${listOfGoods[index].favoriteGoods}');
    listOfGoods[index] = goods.copyWith(favoriteGoods: false);
    print('return value ${listOfGoods[index].favoriteGoods}');
    return false;
  }
}

class GoodsRepository {
  GoodsRepository(this.api);
  final IApi api;
  Future<List<GoodsModel>> fetchData() async => api.fetchData();
}
