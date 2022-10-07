import 'package:flutter/material.dart';

class ChangeView extends ChangeNotifier {
  int currentIndex = 0;
  void changeView(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    notifyListeners();
  }
}

class ChangeViewInherited extends InheritedNotifier<ChangeView> {
  final ChangeView? model;
  const ChangeViewInherited({
    Key? key,
    required this.model,
    required super.child,
  }) : super(
          key: key,
          notifier: model,
        );
  static ChangeViewInherited? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChangeViewInherited>();
  }

  static ChangeViewInherited? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChangeViewInherited>()
        ?.widget;
    return widget is ChangeViewInherited ? widget : null;
  }
}
