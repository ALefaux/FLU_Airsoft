import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/models/apply.dart';
import 'package:airsoft/models/member.dart';
import 'package:airsoft/usecases/team_usecase.dart';

class TeamAppliesViewModel {
  final TeamUsecase _teamUsecase = UsecaseInjector.getTeamUsecase();

  Stream<List<Apply>> getApplies(String teamId) {
    return _teamUsecase.getApplies(teamId);
  }

  Future<void> acceptApply(String teamId, Apply apply) {
    final Member member = Member.ofSoldier(userId: apply.userId, userName: apply.userName, teamId: teamId);
    return _teamUsecase.acceptApply(member);
  }

  Future<void> refuseApply(String teamId, String userId) {
    return _teamUsecase.refuseApply(teamId, userId);
  }

}