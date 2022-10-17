import 'package:flutter/material.dart';

class MainShopViewModel {
  List<Widget> separatedCategoryGoods(List<Widget> widget) {
    final List<Widget> widgets = [];
    for (var element in widget) {
      widgets.add(element);
      if (element != widget[widget.length - 1]) {
        widgets.add(Divider(height: 0.5, color: Colors.black.withOpacity(0.2)));
      }
    }
    return widgets;
  }
}
