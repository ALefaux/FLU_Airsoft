import 'package:airsoft/main.dart';
import 'package:airsoft/usecases/member_usecase.dart';
import 'package:airsoft/usecases/team_usecase.dart';

class UsecaseInjector {
  static void initLocator() {
    getIt.registerLazySingleton(() => TeamUsecase());
    getIt.registerLazySingleton(() => MemberUsecase());
  }

  static TeamUsecase getTeamUsecase() {
    return getIt<TeamUsecase>();
  }

  static MemberUsecase getMemberUsecase() {
    return getIt<MemberUsecase>();
  }
}