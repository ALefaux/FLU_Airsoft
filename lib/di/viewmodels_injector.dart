import 'package:airsoft/main.dart';
import 'package:airsoft/views/team/team_applies/team_applies_view_model.dart';

class ViewModelInjector {
  static void initLocator() {
    getIt.registerLazySingleton(() => TeamAppliesViewModel());
  }

  static TeamAppliesViewModel getTeamAppliesViewModel() {
    return getIt<TeamAppliesViewModel>();
  }
}