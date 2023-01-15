import 'package:flutter/cupertino.dart';

class PaymentViewModel {
  PaymentViewModel({
    required this.csvCvv,
    required this.numCard,
  });

  final TextEditingController csvCvv;
  final TextEditingController numCard;

  void saveData(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class PaymentProvider extends InheritedWidget {
  final PaymentViewModel model;
  const PaymentProvider({Key? key, required this.model, required super.child})
      : super(key: key);
  static PaymentProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PaymentProvider>();
  }

  @override
  bool updateShouldNotify(PaymentProvider oldWidget) {
    return model != oldWidget.model;
  }
}
