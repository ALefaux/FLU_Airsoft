import 'package:airsoft/main.dart';
import 'package:airsoft/views/team/members/team_members_view_model.dart';
import 'package:airsoft/views/team/team_applies/team_applies_view_model.dart';

class ViewModelInjector {
  static void initLocator() {
    getIt.registerLazySingleton(() => TeamAppliesViewModel());
    getIt.registerLazySingleton(() => TeamMembersViewModel());
  }

  static TeamAppliesViewModel getTeamAppliesViewModel() {
    return getIt<TeamAppliesViewModel>();
  }

  static TeamMembersViewModel getMembersViewModel() {
    return getIt<TeamMembersViewModel>();
  }
}