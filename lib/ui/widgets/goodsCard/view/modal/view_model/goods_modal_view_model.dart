import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/modal/cubit/goods_modal_cubit.dart';

class GoodsModalViewModel {
  GoodsModalViewModel({required this.context, required this.model, required this.cubit});

  final BuildContext context;

  final GoodsModalCubit cubit;

  final GoodsModel model;

  void onIncrementCountPressed() {
    cubit.increment();
  }

  void onDecrementCountPressed() {
    cubit.decrement();
  }

  void onAddToCardPressed() {
    cubit.addToCard(model);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Товар ${model.nameGoods} Добавлен в корзину в количестве ${cubit.state.countGoods} штук'),
      ),
    );
  }
}
