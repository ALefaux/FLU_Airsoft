import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/repositories/member_repository.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/repositories/team_repository.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:airsoft/usecases/team_usecase.dart';
import 'package:flutter/material.dart';

class TeamViewModel extends ChangeNotifier {
  final TeamUsecase _teamUsecase = UsecaseInjector.getTeamUsecase();
  final UserRepository _userRepository = DependencyInjector.getUserRepository();
  final TeamRepository _teamRepository = DependencyInjector.getTeamRepository();
  final MemberRepository _memberRepository =
      DependencyInjector.getMemberRepository();
  final SharedPrefRepository _sharedPrefRepository =
      DependencyInjector.getSharedPrefReporsitory();

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
}
