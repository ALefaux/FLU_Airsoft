import 'package:airsoft/di/dependency_injector.dart';

class SharedPrefRepository {
  final _sharedPrefs = DependencyInjector.getSharedPreferences();

  void saveString(String key, String value) {
    _sharedPrefs.setString(key, value);
  }

  void saveBoolean(String key, bool value) {
    _sharedPrefs.setBool(key, value);
  }

  void saveInt(String key, int value) {
    _sharedPrefs.setInt(key, value);
  }

  String getString(String key) {
    return _sharedPrefs.getString(key) ?? "";
  }

  bool getBoolean(String key) {
    return _sharedPrefs.getBool(key) ?? false;
  }

  int? getInt(String key) {
    return _sharedPrefs.getInt(key);
  }

  void deleteSavedValue(String key) {
    _sharedPrefs.remove(key);
  }

  void eraseAllData() {
    _sharedPrefs.remove(hasTeam);
    _sharedPrefs.remove(userId);
    _sharedPrefs.remove(userTeamId);
  }

  static String hasTeam = "HAS_TEAM";
  static String userId = "USER_ID";
  static String userTeamId = "USER_TEAM_ID";

}