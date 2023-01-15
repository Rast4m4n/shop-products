import 'package:flutter/cupertino.dart';

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
  void saveData(BuildContext context) {
    Navigator.of(context).pop();
  }
}
