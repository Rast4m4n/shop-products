import 'package:shop_products/data/api/services/interface_api.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class MockApi implements IApi {
  @override
  Future<List<GoodsModel>> fetchData() async {
    final listOfGoods = Json.goods;
    return listOfGoods.map((e) => GoodsModel.fromJson(e)).toList();
  }

  @override
  void saveGoods(List<GoodsModel> listOfGoods) async {
    Json.goods = listOfGoods.map((e) => e.toJson()).toList();
  }

  @override
  Future<void> addToFavoriteGoods(GoodsModel goods) async {
    final listOfGoods = await fetchData();
    final index = listOfGoods.indexWhere((element) => element.id == goods.id);
    listOfGoods[index] = goods.copyWith(favoriteGoods: true);
    saveGoods(listOfGoods);
  }

  @override
  Future<void> removeFavoriteGoods(GoodsModel goods) async {
    final listOfGoods = await fetchData();
    final index = listOfGoods.indexWhere((element) => element.id == goods.id);
    listOfGoods[index] = goods.copyWith(favoriteGoods: false);
    saveGoods(listOfGoods);
  }
}
