import 'package:flutter/material.dart';

class AuthViewModel {
  AuthViewModel({required this.phoneController});

  final TextEditingController phoneController;

  void recievPinCode() {
    final number = phoneController.text;
  }
}
