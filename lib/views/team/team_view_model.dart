import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:airsoft/usecases/team_usecase.dart';
import 'package:flutter/material.dart';

class TeamViewModel extends ChangeNotifier {
  final TeamUsecase _teamUsecase;

  TeamViewModel(this._teamUsecase);

  List<Team> _teams = [];
  List<Team> get teams => _teams;

  Team? currentTeam;

  Future<Team?> createTeam(String name) async {
    return await _teamUsecase.createTeam(name);
  }

  Future<void> searchTeams(String search) async {
    _teams = await _teamUsecase.searchTeams(search);
    notifyListeners();
  }

  Future<SaveState> removeTeamForUser(int? teamId) async {
    if (teamId != null) {
      return _teamUsecase.removeTeamForUser(teamId);
    } else {
      return SaveState.error;
    }
  }

  Future<Team?> getUserTeam() async {
    if (currentTeam != null) {
      return currentTeam;
    } else {
      return _teamUsecase.getUserTeam().then((value) {
        currentTeam = value;
        return value;
      });
    }
  }

  Future<bool> userIsGeneral() async {
    if (currentTeam != null) {
      return _teamUsecase.userIsGeneral(currentTeam!);
    } else {
      return false;
    }
  }

  Future<bool> isAlone() async {
    if (currentTeam != null) {
      return _teamUsecase.userIsAlone(currentTeam!);
    } else {
      return false;
    }
  }

  Future<SaveState> deleteTeam() async {
    return _teamUsecase.deleteTeam();
  }

  Future<SaveState> applyToTeam(int? teamId) async {
    if (teamId != null) {
      return _teamUsecase.applyToTeam(teamId);
    } else {
      return SaveState.error;
    }
  }

  Future<Apply?> userHasApplied(int? teamId) async {
    if (teamId != null) {
      return _teamUsecase.userHasApplied(teamId);
    } else {
      return null;
    }
  }

  Future<SaveState> removeApplyForUser(int? teamId) async {
    if (teamId != null) {
      return _teamUsecase.removeApplyForUser(teamId);
    } else {
      return SaveState.error;
    }
  }

  Future<void> updateCanApplies(Team team) async {
    return _teamUsecase.updateTeam(team);
  }
}
