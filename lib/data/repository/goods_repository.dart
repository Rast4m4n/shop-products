import 'package:shop_products/data/api/interface_api.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class GoodsRepository {
  GoodsRepository(this.api);
  final IApi api;
  Future<List<GoodsModel>> fetchData() => api.fetchData();

  Future<void> addToFavoriteOneGoods(GoodsModel goods) =>
      api.addToFavoriteGoods(goods);

  Future<void> removeFavoriteGoods(GoodsModel goods) =>
      api.removeFavoriteGoods(goods);
}
