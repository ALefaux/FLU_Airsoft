import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/apply.dart';
import 'package:airsoft/models/grade.dart';
import 'package:airsoft/models/member.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/models/user.dart';
import 'package:airsoft/repositories/grade_repository.dart';
import 'package:airsoft/repositories/member_repository.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/repositories/team_repository.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'dart:developer' as developer;

class TeamUsecase {
  final _tag = "TeamUsecase";
  final TeamRepository _teamRepository = DependencyInjector.getTeamRepository();
  final UserRepository _userRepository = DependencyInjector.getUserRepository();
  final GradeRepository _gradeRepository =
      DependencyInjector.getGradeRepository();
  final MemberRepository _memberRepository =
      DependencyInjector.getMemberRepository();
  final SharedPrefRepository _sharedPrefRepository =
      DependencyInjector.getSharedPrefReporsitory();

  Future<Team?> createTeam(Team team) async {
    SaveState saveState = await _teamRepository.saveTeam(team);

    if (saveState == SaveState.saved) {
      _sharedPrefRepository.saveHasTeam(true);
      final Grade grade = await _gradeRepository.getHigherGrade();
      final User user = await _userRepository.getUser();
      final Member member =
          Member(gradeLevel: grade.level, userId: user.id, userName: user.soldierName, teamId: team.id);
      _memberRepository.addMember(member);
      return team;
    } else {
      return null;
    }
  }

  Future<List<Team>> searchTeams(String search) async {
    return _teamRepository.searchTeams(search);
  }

  Future<SaveState> removeTeamForUser() async {
    developer.log("Remove team for user ...", name: _tag);
    final userId = _userRepository.getUserId();

    if (await _memberRepository.removeTeamToUser(userId)) {
      developer.log("Team removed for user $userId in BO", name: _tag);
      _sharedPrefRepository.deleteHasTeam();
      return SaveState.saved;
    } else {
      developer.log("Couldn't remove team for $userId in BO", name: _tag);
      return SaveState.error;
    }
  }

  Future<SaveState> setTeamToUser(Team team) async {
      final User user = await _userRepository.getUser();
    final Member member =
        Member(gradeLevel: 1, teamId: team.id, userId: user.id, userName: user.soldierName);

    if (await _memberRepository.addMember(member)) {
      return SaveState.saved;
    } else {
      return SaveState.error;
    }
  }

  Future<void> updateTeam(Team team) async {
    return _teamRepository.updateTeam(team);
  }

  Future<Team?> getUserTeam() async {
    final bool hasTeam = _sharedPrefRepository.hasTeam();

    if (hasTeam) {
      final String userId = _userRepository.getUserId();
      final String teamId = await _memberRepository.getTeamId(userId);
      return await _teamRepository.getTeamById(teamId);
    } else {
      return null;
    }
  }

  Future<bool> userIsGeneral() async {
    final String userId = _userRepository.getUserId();
    final Member? member = await _memberRepository.getMember(userId);

    if (member != null) {
      final Grade grade = await _gradeRepository.getHigherGrade();
      return member.gradeLevel == grade.level;
    } else {
      return false;
    }
  }

  Future<bool> userIsAlone() async {
    final String userId = _userRepository.getUserId();
    return _memberRepository.isAlone(userId);
  }

  Future<SaveState> deleteTeam() async {
    final Team? team = await getUserTeam();

    if(team != null) {
      await removeTeamForUser();
      await _teamRepository.deleteTeam(team.id);
      return SaveState.saved;
    } else {
      return SaveState.error;
    }
  }

  Future<SaveState> applyToTeam(String teamId) async {
    final User user = await _userRepository.getUser();
    final Apply apply = Apply(userId: user.id, userName: user.soldierName);
    return await _teamRepository.applyToTeam(teamId, apply);
  }

  Stream<Apply?> userHasApplied(String teamId) {
    final String userId = _userRepository.getUserId();
    return _teamRepository.getApplyForUser(teamId, userId);
  }

  Future<void> removeApplyForUser(String teamId) async {
    final String userId = _userRepository.getUserId();
    return _teamRepository.removeApplyForUser(teamId, userId);
  }

  Stream<List<Apply>> getApplies(String teamId) {
    return _teamRepository.getApplies(teamId);
  }

  Future<void> acceptApply(Member member) {
    return _memberRepository.addMember(member).then((value) {
      _teamRepository.removeApply(member.teamId, member.userId);
    });
  }

  Future<void> refuseApply(String teamId, String userId) {
    return _teamRepository.removeApply(teamId, userId);
  }
}
