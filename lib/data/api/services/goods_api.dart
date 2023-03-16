// import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shop_products/data/api/utils/api_client_exception.dart';
import 'package:shop_products/data/api/interface_api.dart';
import 'package:shop_products/data/api/config/url_api.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class GoodsApi extends IApi {
  final _client = Client();

  @override
  Future<List<GoodsModel>> fetchData() async {
    List<GoodsModel> listGoods = [];
    try {
      final response = await _client.get(Uri.parse(UrlApi.goodsUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes)) as List;
        listGoods = data
            .map(
              (e) => GoodsModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    return listGoods;
  }

  @override
  Future<void> removeFavoriteGoods(GoodsModel goods) {
    throw UnimplementedError();
  }

  @override
  Future<void> addToFavoriteGoods(GoodsModel goods) {
    throw UnimplementedError();
  }

  @override
  void saveGoods(List<GoodsModel> listOfGoods) {
    throw UnimplementedError();
  }
}
