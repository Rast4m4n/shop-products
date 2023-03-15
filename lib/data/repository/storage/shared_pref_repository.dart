import 'package:shared_preferences/shared_preferences.dart';

abstract class _StorageKeys {
  static const String isDark = "isDark";
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
}
