import 'package:flutter/cupertino.dart';
import 'package:shop_products/data/repository/shared_pref_repository.dart';
import 'package:shop_products/domain/models/user_model.dart';

class ReceiverViewModel {
  ReceiverViewModel({
    required this.nameController,
    required this.phoneNumController,
    required this.addressController,
    required this.flatController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneNumController;
  final TextEditingController addressController;
  final TextEditingController flatController;

  Future<void> saveData(BuildContext context) async {
    final userData = UserModel(
      fio: nameController.text,
      address: addressController.text,
      phoneNumber: phoneNumController.text,
      flat: flatController.text,
    );

    await SharedPreferencesRepository.instance.saveDataOfUser(userData);
  }
}
