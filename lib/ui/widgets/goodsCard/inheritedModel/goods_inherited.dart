import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class GoodsInherited extends InheritedWidget {
  final GoodsModel? model;
  const GoodsInherited({
    Key? key,
    required this.model,
    required super.child,
  }) : super(key: key);

  static GoodsInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GoodsInherited>();
  }

  @override
  bool updateShouldNotify(GoodsInherited oldWidget) {
    return model != oldWidget.model;
  }
}
