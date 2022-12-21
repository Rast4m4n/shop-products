import 'package:shop_products/domain/models/goods_model.dart';

class CartModel {
  const CartModel();
  static List<GoodsModel> cartGoods = [];

  String get amountOfGoodsString => amountOfGoods().toString();

  int get summOfGoods =>
      cartGoods.fold(0, (total, current) => total + current.priceGoods);
  final int discont = 0;

  String get summOfGoodsString => summOfGoods.toString();
  String get discontString => discont.toString();
  String get deliveryString => delivery(summOfGoods).toString();

  String get totalSummString => totalSumm().toString();

  int totalSumm() {
    return summOfGoods + delivery(summOfGoods) - discont;
  }

  int amountOfGoods() {
    return cartGoods.length;
  }

  int delivery(int summOfGoods) {
    if (summOfGoods >= 699) {
      return 0;
    } else {
      return 199;
    }
  }

  Map<GoodsModel, int> countOfGoods() {
    Map<GoodsModel, int> count = {};
    for (var goods in cartGoods) {
      if (count.containsKey(goods)) {
        count[goods] = count[goods]! + 1;
      } else {
        count[goods] = 1;
      }
    }
    return count;
  }
}
