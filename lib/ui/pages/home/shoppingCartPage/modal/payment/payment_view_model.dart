import 'package:flutter/cupertino.dart';
import 'package:shop_products/data/repository/shared_pref_repository.dart';
import 'package:shop_products/domain/models/bank_cards_model.dart';

class PaymentViewModel {
  PaymentViewModel({
    required this.cvvController,
    required this.numCardController,
  });

  final TextEditingController cvvController;
  final TextEditingController numCardController;

  Future<void> saveData(BuildContext context) async {
    final bankCard = BankCardModel(
      numCard: numCardController.text,
      cvv: cvvController.text,
    );

    await SharedPreferencesRepository.instance.saveBankCard(bankCard);
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
