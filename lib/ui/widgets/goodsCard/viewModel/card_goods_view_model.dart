import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class CardGoodsViewModel {
  int counter = 1;
  bool isAddedToCart = false;

  Future<void> toFavoriteGoods(GoodsModel goods) async {
    final goodsRepo = MockApi();
    print("before changed value ${goods.favoriteGoods}");
    final isFavorite = goods.favoriteGoods
        ? await goodsRepo.removeFavoriteGoods(goods)
        : await goodsRepo.addToFavoriteOneGoods(goods);
    print("current value $isFavorite");
  }

  void addToCart() {
    isAddedToCart = true;
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
