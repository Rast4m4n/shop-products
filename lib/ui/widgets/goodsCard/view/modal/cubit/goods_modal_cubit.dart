import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_products/data/json.dart';
import 'package:shop_products/domain/models/goods_model.dart';

part 'goods_modal_state.dart';

class GoodsModalCubit extends Cubit<GoodsModalState> {
  GoodsModalCubit() : super(const GoodsModalInitial(countGoods: 1));

  void increment() {
    emit(state.copyWith(countGoods: state.countGoods + 1));
  }

  void decrement() {
    emit(state.copyWith(countGoods: state.countGoods - 1));
  }

  void addToCard(GoodsModel goods) {
    for (int i = 0; i < state.countGoods; i++) Json.cartGoods.add(goods);
  }
}
