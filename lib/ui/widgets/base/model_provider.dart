import 'package:flutter/material.dart';

class ModelProvider<Model> extends InheritedWidget {
  const ModelProvider({super.key, required super.child, required this.model});

  final Model model;

  static ModelProvider<ViewModel>? of<ViewModel>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ModelProvider<ViewModel>>();
  }

  @override
  bool updateShouldNotify(ModelProvider oldWidget) {
    return true;
  }
}
