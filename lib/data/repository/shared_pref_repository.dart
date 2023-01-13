import 'package:shared_preferences/shared_preferences.dart';

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
  Future<void> saveDataOfUser(String userData) async {
    await (await pref).setString(_StorageKeys.user, userData);
  }

  Future<String> loadDataOfUser() async {
    return (await pref).getString(_StorageKeys.user) ?? 'Неизвестен';
  }

  //---------Данные о банковских картах-----------------

  Future<void> saveBankCard(String bankCard) async {
    await (await pref).setString(_StorageKeys.bankCard, bankCard);
  }

  Future<String> loadBankCard() async {
    return (await pref).getString(_StorageKeys.bankCard) ?? 'Неизвестен';
  }
}
