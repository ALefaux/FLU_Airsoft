import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/repositories/team_repository.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:airsoft/views/energyconverter/energy_converter_view_model.dart';
import 'package:airsoft/views/home/home_view_model.dart';
import 'package:airsoft/views/login/login_view_model.dart';
import 'package:airsoft/views/profile/profile_view_model.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjector {

  static void initLocator() async {
    GetIt instance = GetIt.instance;
    instance.registerLazySingleton(() => HomeViewModel());
    instance.registerLazySingleton(() => LoginViewModel());
    instance.registerLazySingleton(() => EnergyConverterViewModel());
    instance.registerLazySingleton(() => ProfileViewModel());
    instance.registerLazySingleton(() => TeamViewModel());

    instance.registerFactory(() => UserRepository());
    instance.registerFactory(() => TeamRepository());
    instance.registerFactory(() => SharedPrefRepository());

    instance.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  }

  static HomeViewModel getHomeViewModel() {
    return GetIt.instance<HomeViewModel>();
  }

  static LoginViewModel getLoginViewModel() {
    return GetIt.instance<LoginViewModel>();
  }

  static EnergyConverterViewModel getEnergyViewModel() {
    return GetIt.instance<EnergyConverterViewModel>();
  }

  static ProfileViewModel getProfileViewModel() {
    return GetIt.instance<ProfileViewModel>();
  }

  static TeamViewModel getTeamViewModel() {
    return GetIt.instance<TeamViewModel>();
  }

  static UserRepository getUserRepository() {
    return GetIt.instance<UserRepository>();
  }

  static TeamRepository getTeamRepository() {
    return GetIt.instance<TeamRepository>();
  }

  static SharedPreferences getSharedPreferences() {
    return GetIt.instance<SharedPreferences>();
  }

  static SharedPrefRepository getSharedPrefReporsitory() {
    return GetIt.instance<SharedPrefRepository>();
  }
}
