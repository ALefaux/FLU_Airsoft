import 'package:airsoft/di/dependency_injector.dart';

class SharedPrefRepository {
  final _sharedPrefs = DependencyInjector.getSharedPreferences();

  void saveHasTeam(bool hasTeam) {
    _sharedPrefs.setBool(_hasTeam, hasTeam);
  }

  bool hasTeam() {
    return _sharedPrefs.getBool(_hasTeam) ?? false;
  }

  void deleteHasTeam() {
    _sharedPrefs.remove(_hasTeam);
  }

  final String _hasTeam = "HAS_TEAM";

}