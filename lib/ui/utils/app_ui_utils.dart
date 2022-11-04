import 'package:flutter/material.dart';

abstract class AppUiUtils {
  static List<Widget> buildSeparated(List<Widget> widgets) {
    final List<Widget> resultWidgets = [];
    for (var element in widgets) {
      resultWidgets.add(element);
      if (element != widgets[widgets.length - 1]) {
        resultWidgets.add(Divider(height: 0.5, color: Colors.black.withOpacity(0.2)));
      }
    }
    return resultWidgets;
  }
}
