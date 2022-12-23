part of '../view/goods_card_factory.dart';

class _GoodsCardViewModel extends ChangeNotifier {
  _GoodsCardViewModel({
    required this.goods,
    required GoodsRepository goodsRepository,
    required this.updateCart,
    int? initialCountOfGoods,
  }) : _goodsRepository = goodsRepository {
    isFavorite = goods.favoriteGoods;
    if (initialCountOfGoods != null) {
      countOfGoods = initialCountOfGoods;
    }
  }
  VoidCallback updateCart;
  int countOfGoods = 0;
  final GoodsModel goods;
  bool isAddedToCart = false;
  final GoodsRepository _goodsRepository;
  bool isFavorite = false;

//Товар становится истинно избранным только
//после обновления страницы каталога товаров, а так, избранным
//становиться он только для вида, для карточки.
//Нужно это исправить
  Future<void> onFavoriteButtonPressed() async {
    isFavorite
        ? await _goodsRepository.removeFavoriteGoods(goods)
        : await _goodsRepository.addToFavoriteOneGoods(goods);
    isFavorite = !isFavorite;
    if (CartModel.cartGoods.contains(goods)) {
      final index = CartModel.cartGoods.indexOf(goods);
      CartModel.cartGoods[index] = goods.copyWith(favoriteGoods: isFavorite);
    }
    notifyListeners();
  }

  void onIncrementButtonPressed() {
    countOfGoods += 1;
    CartModel.cartGoods.add(goods);
    updateCart();
    notifyListeners();
  }

  void onDecrementButtonPressed() {
    final index = CartModel.cartGoods.indexOf(goods);
    if (index != -1) {
      countOfGoods -= 1;
      updateCart();
      CartModel.cartGoods.removeAt(index);
    }
    if (countOfGoods == 0) {
      updateCart();
      isAddedToCart = false;
    }
    notifyListeners();
  }

  void onAddToCartButtonPressed() {
    isAddedToCart = true;
    onIncrementButtonPressed();
  }

  void onDeleteGoodsFromCart() {
    CartModel.cartGoods.removeWhere((el) => el.id == goods.id);
    updateCart();
    countOfGoods = 0;
    notifyListeners();
  }
}

class GoodsInheritViewModel extends InheritedNotifier<_GoodsCardViewModel> {
  // ignore: library_private_types_in_public_api
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
