import 'package:airsoft/main.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/repositories/team_repository.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:airsoft/storage/database.dart';
import 'package:airsoft/views/energyconverter/energy_converter_view_model.dart';
import 'package:airsoft/views/profile/profile_view_model.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjector {

  static void initLocator() async {
    getIt.registerLazySingleton(() => EnergyConverterViewModel());
    getIt.registerLazySingleton(() => ProfileViewModel());
    getIt.registerLazySingleton(() => TeamViewModel(getIt()));

    getIt.registerFactory(() => UserRepository(getIt()));
    getIt.registerFactory(() => TeamRepository());
    getIt.registerFactory(() => SharedPrefRepository());

    getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
    
    getIt.registerLazySingleton(() => AppDatabase());
  }

  static EnergyConverterViewModel getEnergyViewModel() {
    return getIt<EnergyConverterViewModel>();
  }

  static ProfileViewModel getProfileViewModel() {
    return getIt<ProfileViewModel>();
  }

  static TeamViewModel getTeamViewModel() {
    return getIt<TeamViewModel>();
  }

  static UserRepository getUserRepository() {
    return getIt<UserRepository>();
  }

  static TeamRepository getTeamRepository() {
    return getIt<TeamRepository>();
  }

  static SharedPreferences getSharedPreferences() {
    return getIt<SharedPreferences>();
  }

  static SharedPrefRepository getSharedPrefReporsitory() {
    return getIt<SharedPrefRepository>();
  }
}
