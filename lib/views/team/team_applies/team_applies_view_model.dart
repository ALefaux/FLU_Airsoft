import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/usecases/team_usecase.dart';

class TeamAppliesViewModel {
  final TeamUsecase _teamUsecase = UsecaseInjector.getTeamUsecase();

  Future<List<Apply>> getApplies(int? teamId) async {
    if(teamId != null) {
    return _teamUsecase.getApplies(teamId);
    } else {
      return [];
    }
  }

  Future<void> acceptApply(int applyId) {
    return _teamUsecase.acceptApply(applyId);
  }

  Future<void> refuseApply(int applyId) {
    return _teamUsecase.refuseApply(applyId);
  }

}