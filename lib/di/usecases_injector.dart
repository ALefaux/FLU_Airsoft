import 'package:airsoft/main.dart';
import 'package:airsoft/usecases/team_usecase.dart';

class UsecaseInjector {
  static void initLocator() {
    getIt.registerLazySingleton(() => TeamUsecase());
  }

  static TeamUsecase getTeamUsecase() {
    return getIt<TeamUsecase>();
  }
}