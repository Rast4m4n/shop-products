import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shop_products/data/api/utils/api_client_exception.dart';
import 'package:shop_products/data/api/config/url_api.dart';

class UserApi {
  Future<void> createUser({required String phoneNumber}) async {
    try {
      final response = await http.post(
        Uri.parse(UrlApi.usersApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            'phoneNumber': phoneNumber,
          },
        ),
      );
      if (response.statusCode == 401) {
        throw ApiClientException(ApiClientExceptionType.auth);
      }
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
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
