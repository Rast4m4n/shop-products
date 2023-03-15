import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_products/data/api/static/url_api.dart';
import 'package:shop_products/domain/models/user_model.dart';

class UserApi {
  Future<UserModel> createUser({required String phoneNumber}) async {
    // здесь будет ссылка на api пользовательских данных
    final response = await http.post(
      Uri.parse(UrlApi.baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'phoneNumber': phoneNumber,
        },
      ),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to create user');
    }
  }

  // Нужно сервер доработать перед использованием этого метода
  Future<String?> makeSession({required String requestToken}) async {
    final response = await http.post(
      Uri.parse('sessionId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'requestToken': requestToken,
        },
      ),
    );

    if (response.statusCode == 200) {
      final sessionId = response.headers['sessionId'];
      return sessionId;
    } else {
      throw Exception('Сессия не найдена');
    }
  }
}
