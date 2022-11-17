import 'package:shared_preferences/shared_preferences.dart';

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
