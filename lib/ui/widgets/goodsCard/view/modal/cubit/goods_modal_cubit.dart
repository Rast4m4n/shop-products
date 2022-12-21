// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shop_products/domain/models/cart_model.dart';
import 'package:shop_products/domain/models/goods_model.dart';

part 'goods_modal_state.dart';

class GoodsModalCubit extends Cubit<GoodsModalState> {
  GoodsModalCubit() : super(const GoodsModalInitial(countGoods: 1));

  void increment() {
    emit(state.copyWith(countGoods: state.countGoods + 1));
  }

  void decrement() {
    if (state.countGoods > 1) {
      emit(state.copyWith(countGoods: state.countGoods - 1));
    }
  }

  void addToCard(GoodsModel goods) {
    for (int i = 0; i < state.countGoods; i++) {
      CartModel.cartGoods.add(goods);
    }
  }
}
