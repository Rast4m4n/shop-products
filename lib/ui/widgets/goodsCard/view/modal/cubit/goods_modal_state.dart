part of 'goods_modal_cubit.dart';

@immutable
abstract class GoodsModalState {
  const GoodsModalState({required this.countGoods});
  final int countGoods;

  GoodsModalState copyWith({int? countGoods});
}

class GoodsModalInitial extends GoodsModalState {
  const GoodsModalInitial({required super.countGoods});

  @override
  GoodsModalInitial copyWith({
    int? countGoods,
  }) {
    return GoodsModalInitial(
      countGoods: countGoods ?? this.countGoods,
    );
  }
}
