import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_products/data/api/utils/api_client_exception.dart';
import 'package:shop_products/data/api/services/user_api.dart';
import 'package:shop_products/data/repository/storage/session_data_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final _userApi = UserApi();
  // final _sessionDataRepository = SessionDataRepository();
  final phoneController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> auth() async {
    final number = phoneController.text;
    if (number.isEmpty) {
      _errorMessage = 'Нужно ввести номер!';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    notifyListeners();
    try {
      await _userApi.createUser(phoneNumber: number);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          _errorMessage = 'Сервер недоступен, попробуйте позже!';
          break;
        case ApiClientExceptionType.auth:
          _errorMessage = 'Ошибка авторизации! Неправильно набран номер';
          break;
        case ApiClientExceptionType.other:
          _errorMessage = 'Произошла ошибка. Попробуйте ещё раз';
          break;
      }
    }
    notifyListeners();

    // _sessionDataRepository.setSessionId(sessionId);
  }
}
