import 'package:flutter/material.dart';

class ViewModelProvider<ViewModel> extends InheritedWidget {
  const ViewModelProvider({super.key, required super.child, required this.vm});

  final ViewModel vm;

  static ViewModelProvider<ViewModel>? of<ViewModel>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewModelProvider<ViewModel>>();
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) {
    return true;
  }
}
