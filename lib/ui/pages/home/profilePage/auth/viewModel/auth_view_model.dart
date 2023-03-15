import 'package:flutter/material.dart';
import 'package:shop_products/data/api/services/user_api.dart';
import 'package:shop_products/data/repository/storage/session_data_repository.dart';

class AuthViewModel {
  final _userApi = UserApi();
  final _sessionDataRepository = SessionDataRepository();
  final phoneController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> auth() async {
    final number = phoneController.text;
    if (number.isEmpty) {
      _errorMessage = 'Нужно ввести номер!';
      return;
    }
    _errorMessage = null;
    await _userApi.createUser(phoneNumber: number);
    // _sessionDataRepository.setSessionId(sessionId);
  }
}
