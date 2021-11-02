import 'package:airsoft/usecases/team_usecase.dart';
import 'package:get_it/get_it.dart';

class UsecaseInjector {
  static void initLocator() {
    GetIt instance = GetIt.instance;
    instance.registerLazySingleton(() => TeamUsecase());
  }

  static TeamUsecase getTeamUsecase() {
    return GetIt.instance<TeamUsecase>();
  }
}