// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:shop_products/data/api/services/interface_api.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class GoodsApi extends IApi {
  final _client = Client();
  final _baseUrl = "http://localhost:8000";

  @override
  Future<List<GoodsModel>> fetchData() async {
    List<GoodsModel> listGoods = [];
    try {
      final response = await _client.get(Uri.parse('$_baseUrl/api/goods/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes)) as List;
        listGoods = data
            .map((e) => GoodsModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return listGoods;
  }

  @override
  Future<void> removeFavoriteGoods(GoodsModel goods) {
    // TODO: implement removeFavoriteGoods
    throw UnimplementedError();
  }

  @override
  Future<void> addToFavoriteGoods(GoodsModel goods) {
    // TODO: implement addToFavoriteGoods
    throw UnimplementedError();
  }

  @override
  void saveGoods(List<GoodsModel> listOfGoods) {
    // TODO: implement saveGoods
  }
}
