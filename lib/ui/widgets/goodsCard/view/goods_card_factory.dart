import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_products/data/json.dart';

import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';
import 'package:shop_products/ui/theme/app_icons.dart';
import 'package:shop_products/ui/theme/app_paddings.dart';
import 'package:shop_products/ui/theme/app_theme.dart';
import 'package:shop_products/ui/widgets/base/model_provider.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/modal/cubit/goods_modal_cubit.dart';
import 'package:shop_products/ui/widgets/goodsCard/view/modal/view_model/goods_modal_view_model.dart';

part 'modal/goods_modal_widget.dart';
part '../viewModel/goods_card_view_model.dart';
part 'goods_card.dart';
part 'goods_card_for_cart.dart';
part 'widget/favorite_button.dart';

abstract class GoodsCardFactory {
  static GoodsCardWidget catalog({required GoodsModel goods}) {
    return GoodsCardWidget(goods: goods);
  }

  static GoodsCardForCart cart({
    required GoodsModel goods,
    required int countOfGoods,
  }) {
    return GoodsCardForCart(
      goods: goods,
      countOfGoods: countOfGoods,
    );
  }
}
