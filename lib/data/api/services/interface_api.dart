import 'package:shop_products/domain/models/goods_model.dart';

abstract class IApi {
  Future<List<GoodsModel>> fetchData();

  void saveGoods(List<GoodsModel> listOfGoods);

  Future<void> addToFavoriteGoods(GoodsModel goods);

  Future<void> removeFavoriteGoods(GoodsModel goods);
}
