import 'package:flutter/material.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class CardInherited extends InheritedWidget {
  final GoodsModel? model;
  const CardInherited({Key? key, required this.model, required super.child})
      : super(key: key);
  static CardInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardInherited>();
  }

  @override
  bool updateShouldNotify(CardInherited oldWidget) {
    return model != oldWidget.model;
  }
}
