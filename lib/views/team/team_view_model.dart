import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/models/apply.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/usecases/team_usecase.dart';
import 'package:flutter/material.dart';

class TeamViewModel extends ChangeNotifier {
  final TeamUsecase _teamUsecase = UsecaseInjector.getTeamUsecase();

  List<Team> _teams = [];
  List<Team> get teams => _teams;

  Future<Team?> createTeam(String name) async {
    final Team team = Team(name: name);
    return _teamUsecase.createTeam(team);
  }

  Future<void> searchTeams(String search) async {
    _teams = await _teamUsecase.searchTeams(search);
    notifyListeners();
  }

  Future<SaveState> removeTeamForUser() async {
    return _teamUsecase.removeTeamForUser();
  }

  Future<SaveState> setTeamToUser(Team team) async {
    return _teamUsecase.setTeamToUser(team);
  }

  Future<Team?> getUserTeam() async {
    return _teamUsecase.getUserTeam();
  }

  Future<bool> userIdGeneral() async {
    return _teamUsecase.userIsGeneral();
  }

  Future<bool> isAlone() async {
    return _teamUsecase.userIsAlone();
  }

  Future<SaveState> deleteTeam() async {
    return _teamUsecase.deleteTeam();
  }

  Future<SaveState> applyToTeam(String teamId) async {
    return _teamUsecase.applyToTeam(teamId);
  }

  Stream<Apply?> userHasApplied(String teamId) {
    return _teamUsecase.userHasApplied(teamId);
  }

  Future<void> removeApplyForUser(String teamId) async {
    return _teamUsecase.removeApplyForUser(teamId);
  }

  Future<void> updateCanApplies(Team team) async {
    return _teamUsecase.updateTeam(team);
  }
}
