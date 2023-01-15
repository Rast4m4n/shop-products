import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_products/domain/models/bank_cards_model.dart';
import 'package:shop_products/domain/models/user_model.dart';

abstract class _StorageKeys {
  static const String isDark = "isDark";
  static const String user = "user";
  static const String bankCard = "bankCard";
}

class SharedPreferencesRepository {
  SharedPreferencesRepository._internal();

  static final SharedPreferencesRepository _singleton =
      SharedPreferencesRepository._internal();
  static SharedPreferencesRepository get instance => _singleton;

  final pref = SharedPreferences.getInstance();

  //------------Темы-----------------

  Future<void> saveTheme(bool theme) async {
    await (await pref).setBool(_StorageKeys.isDark, theme);
  }

  Future<bool> loadTheme() async {
    return (await pref).getBool(_StorageKeys.isDark) ?? false;
  }

  //---------Данные о пользователе------------
  Future<void> saveDataOfUser(UserModel user) async {
    final userMap = user.toJson();
    final userJson = jsonEncode(userMap);
    await (await pref).setString(_StorageKeys.user, userJson);
  }

  Future<UserModel> loadDataOfUser() async {
    final userJson = (await pref).getString(_StorageKeys.user) ?? 'Нет данных';
    final userMap = jsonDecode(userJson) as Map<String, dynamic>;
    final user = UserModel.fromJson(userMap);
    return user;
  }

  //---------Данные о банковских картах-----------------

  Future<void> saveBankCard(BankCardModel bankCard) async {
    final bankCardMap = bankCard.toJson();
    final bankCardJson = jsonEncode(bankCardMap);
    await (await pref).setString(_StorageKeys.bankCard, bankCardJson);
  }

  Future<BankCardModel> loadBankCard() async {
    final bankCardJson =
        (await pref).getString(_StorageKeys.bankCard) ?? 'Нет данных';
    final bankCardMap = jsonDecode(bankCardJson) as Map<String, dynamic>;
    final bankCard = BankCardModel.fromJson(bankCardMap);
    return bankCard;
  }
}
