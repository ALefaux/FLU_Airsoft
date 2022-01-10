import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/models/applies/create_apply.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/teams/create_team.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/repositories/apply_repository.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/repositories/team_repository.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'dart:developer' as developer;

class TeamUsecase {
  final _tag = "TeamUsecase";
  final TeamRepository _teamRepository;
  final UserRepository _userRepository;
  final ApplyRepository _applyRepository;
  final SharedPrefRepository _sharedPrefRepository;

  TeamUsecase(this._teamRepository, this._userRepository,
      this._sharedPrefRepository, this._applyRepository);

  Future<Team?> createTeam(String name) async {
    final int? userId = _userRepository.getCurrentUserId();

    if (userId != null) {
      final CreateTeam createTeam =
          CreateTeam(name: name, acceptApplies: true, chiefId: userId);
      return await _teamRepository.saveTeam(createTeam).then((value) {
        if(value != null && value.id != null) _sharedPrefRepository.saveInt(SharedPrefRepository.userTeamId, value.id!);
        return value;
      });
    } else {
      return null;
    }
  }

  Future<List<Team>> searchTeams(String search) async {
    return _teamRepository.searchTeams(search);
  }

  Future<SaveState> removeTeamForUser(int teamId) async {
    developer.log("Remove team for user ...", name: _tag);
    final int? userId = _userRepository.getCurrentUserId();

    if (userId != null) {
      return _teamRepository
          .removeUser(teamId, userId)
          .then((value) => SaveState.saved)
          .onError((error, stackTrace) => SaveState.error);
    } else {
      return SaveState.error;
    }
  }

  Future<void> updateTeam(Team team) async {
    return _teamRepository.updateTeam(team);
  }

  Future<Team?> getUserTeam() async {
    final int? teamId =
        _sharedPrefRepository.getInt(SharedPrefRepository.userTeamId);

    if (teamId != null) {
      return _teamRepository.getTeamById(teamId);
    } else {
      return null;
    }
  }

  Future<bool> userIsGeneral(Team team) async {
    final int? userId = _userRepository.getCurrentUserId();

    if (userId != null) {
      return team.chief?.id == userId;
    } else {
      return false;
    }
  }

  Future<bool> userIsAlone(Team team) async {
    final int? userId = _userRepository.getCurrentUserId();

    if (userId != null) {
      bool isChief = await userIsGeneral(team);

      if (isChief) {
        return team.members.isEmpty;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<SaveState> deleteTeam() async {
    final Team? team = await getUserTeam();

    if (team != null && team.id != null) {
      await removeTeamForUser(team.id!);
      await _teamRepository.deleteTeam(team.id!);
      return SaveState.saved;
    } else {
      return SaveState.error;
    }
  }

  Future<SaveState> applyToTeam(int teamId) async {
    final User? user = await _userRepository.getCurrentUser();

    if (user != null) {
      final CreateApply createApply =
          CreateApply(applierId: user.id!, teamId: teamId);
      var newApply = await _applyRepository.create(createApply);

      if (newApply != null) {
        return SaveState.saved;
      } else {
        return SaveState.error;
      }
    } else {
      return SaveState.error;
    }
  }

  Future<Apply?> userHasApplied(int teamId) async {
    final User? user = await _userRepository.getCurrentUser();

    if (user != null && user.applies != null && user.applies?.isNotEmpty == true) {
      return user.applies?.singleWhere((element) => element.team.id == teamId);
    } else {
      return null;
    }
  }

  Future<SaveState> removeApplyForUser(int teamId) async {
    final int? userId = _userRepository.getCurrentUserId();

    if (userId != null) {
      return _applyRepository
          .removeForUser(teamId, userId)
          .then((value) => SaveState.saved)
          .onError((error, stackTrace) => SaveState.error);
    } else {
      return SaveState.error;
    }
  }

  Future<List<Apply>> getApplies(int teamId) {
    return _teamRepository.getApplies(teamId);
  }

  Future<void> acceptApply(int applyId) {
    return _applyRepository.accept(applyId);
  }

  Future<void> refuseApply(int applyId) {
    return _applyRepository.decline(applyId);
  }
}
