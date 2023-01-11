import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  SharedPreferencesRepository._internal();

  static final SharedPreferencesRepository _singleton =
      SharedPreferencesRepository._internal();
  static SharedPreferencesRepository get instance => _singleton;

  final pref = SharedPreferences.getInstance();

  //------------Темы-----------------

  Future<void> saveTheme(bool theme) async {
    await (await pref).setBool('isDark', theme);
  }

  Future<bool> loadTheme() async {
    return (await pref).getBool('isDark') ?? false;
  }

  //---------Данные о пользователе------------
  Future<void> saveDataOfUser(String userData) async {
    await (await pref).setString('user', userData);
  }

  Future<String> loadDataOfUser() async {
    return (await pref).getString('user') ?? '';
  }

  //---------Данные о банковских картах-----------------

}
