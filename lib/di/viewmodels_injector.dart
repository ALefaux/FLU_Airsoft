import 'package:airsoft/main.dart';
import 'package:airsoft/views/team/members/members_view_model.dart';
import 'package:airsoft/views/team/team_applies/team_applies_view_model.dart';

class ViewModelInjector {
  static void initLocator() {
    getIt.registerLazySingleton(() => TeamAppliesViewModel());
    getIt.registerLazySingleton(() => MembersViewModel());
  }

  static TeamAppliesViewModel getTeamAppliesViewModel() {
    return getIt<TeamAppliesViewModel>();
  }

  static MembersViewModel getMembersViewModel() {
    return getIt<MembersViewModel>();
  }
}