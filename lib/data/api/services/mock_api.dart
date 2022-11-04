import 'package:shop_products/data/api/services/interface_api.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class MockApi implements IApi {
  @override
  Future<List<GoodsModel>> fetchData() async {
    // final String goodsJson =
    //     await rootBundle.loadString('assets/json/goods/goods.json');
    // final goodsJsonData = jsonDecode(goodsJson) as List<dynamic>;
    // return goodsJsonData
    //     .map((e) => GoodsModel.fromJson(e as Map<String, dynamic>))
    //     .toList();
    final listOfGoods = Json.goods;
    return listOfGoods.map((e) => GoodsModel.fromJson(e)).toList();
  }

  void saveGoods(List<GoodsModel> listOfGoods) async {
    Json.goods = listOfGoods.map((e) => e.toJson()).toList();
  }

  Future<void> addToFavoriteOneGoods(GoodsModel goods) async {
    final listOfGoods = await fetchData();
    final index = listOfGoods.indexWhere((element) => element.id == goods.id);
    listOfGoods[index] = goods.copyWith(favoriteGoods: true);
    saveGoods(listOfGoods);
  }

  Future<void> removeFavoriteGoods(GoodsModel goods) async {
    final listOfGoods = await fetchData();
    final index = listOfGoods.indexWhere((element) => element.id == goods.id);
    listOfGoods[index] = goods.copyWith(favoriteGoods: false);
    saveGoods(listOfGoods);
  }
}
