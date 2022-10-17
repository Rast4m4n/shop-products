import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shop_products/domain/models/goods_model.dart';

abstract class IApi {
  Future<List<GoodsModel>> fetchData();
}

class MockApiRepository implements IApi {
  @override
  Future<List<GoodsModel>> fetchData() async {
    // await Future.delayed(const Duration(seconds: 1));
    final String goodsJson =
        await rootBundle.loadString('assets/json/goods/goods.json');

    final goodsJsonData = jsonDecode(goodsJson) as List<dynamic>;
    final result = goodsJsonData
        .map((e) => GoodsModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return result;
  }
}

class GoodsRepository {
  GoodsRepository(this.api);
  final IApi api;
  Future<List<GoodsModel>> fetchData() async => api.fetchData();
}
