import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_products/data/repository/goods_repository.dart';
import 'package:shop_products/domain/models/goods_model.dart';

class SharedPreferencesRepository {
  SharedPreferencesRepository._internal();

  static final SharedPreferencesRepository _singleton =
      SharedPreferencesRepository._internal();
  static SharedPreferencesRepository get instance => _singleton;

  final pref = SharedPreferences.getInstance();

  //------------Сохранение темы-----------------

  Future<void> saveTheme(bool theme) async {
    await (await pref).setBool('isDark', theme);
  }

  Future<bool> loadTheme() async {
    return (await pref).getBool('isDark') ?? false;
  }
}
