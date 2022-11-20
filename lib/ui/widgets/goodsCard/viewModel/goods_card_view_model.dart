part of '../view/goods_card_factory.dart';

class _GoodsCardViewModel extends ChangeNotifier {
  _GoodsCardViewModel({
    required this.goods,
    required GoodsRepository goodsRepository,
    int? initialCountOfGoods,
  }) : _goodsRepository = goodsRepository {
    isFavorite = goods.favoriteGoods;
    if (initialCountOfGoods != null) {
      countOfGoods = initialCountOfGoods;
    }
  }

  int countOfGoods = 0;
  final GoodsModel goods;
  bool isAddedToCart = false;
  final GoodsRepository _goodsRepository;
  bool isFavorite = false;

  Future<void> onFavoriteButtonPressed() async {
    isFavorite
        ? await _goodsRepository.removeFavoriteGoods(goods)
        : await _goodsRepository.addToFavoriteOneGoods(goods);
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void onIncrementButtonPressed() {
    countOfGoods += 1;
    Json.cartGoods.add(goods);
    notifyListeners();
  }

  void onDecrementButtonPressed() {
    final index = Json.cartGoods.indexOf(goods);
    if (index != -1) {
      countOfGoods -= 1;
      Json.cartGoods.removeAt(index);
    }
    if (countOfGoods == 0) {
      isAddedToCart = false;
    }
    notifyListeners();
  }

  void onAddToCartButtonPressed() {
    isAddedToCart = true;
    onIncrementButtonPressed();
  }

  void onDeleteGoodsFromCart() {
    Json.cartGoods.removeWhere((el) => el.id == goods.id);
    notifyListeners();
  }
}

class GoodsInheritViewModel extends InheritedNotifier<_GoodsCardViewModel> {
  final _GoodsCardViewModel? model;
  const GoodsInheritViewModel({
    Key? key,
    required this.model,
    required super.child,
  }) : super(
          key: key,
          notifier: model,
        );
  static GoodsInheritViewModel? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GoodsInheritViewModel>();
  }

  static GoodsInheritViewModel? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GoodsInheritViewModel>()
        ?.widget;
    return widget is GoodsInheritViewModel ? widget : null;
  }
}
