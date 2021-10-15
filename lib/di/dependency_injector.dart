import 'package:airsoft/repositories/user_repository.dart';
import 'package:airsoft/views/energyconverter/energy_converter_view_model.dart';
import 'package:airsoft/views/home/home_view_model.dart';
import 'package:airsoft/views/login/login_view_model.dart';
import 'package:airsoft/views/profile/profile_view_model.dart';
import 'package:get_it/get_it.dart';

class DependencyInjector {

  static void initLocator() {
    GetIt instance = GetIt.instance;
    instance.registerLazySingleton(() => HomeViewModel());
    instance.registerLazySingleton(() => LoginViewModel());
    instance.registerLazySingleton(() => EnergyConverterViewModel());
    instance.registerLazySingleton(() => ProfileViewModel());

    instance.registerFactory(() => UserRepository());
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

  static UserRepository getUserRepository() {
    return GetIt.instance<UserRepository>();
  }
}
