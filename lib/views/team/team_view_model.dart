import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/repositories/team_repository.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class TeamViewModel extends ChangeNotifier {
  final UserRepository _userRepository = DependencyInjector.getUserRepository();
  final TeamRepository _teamRepository = DependencyInjector.getTeamRepository();
  final SharedPrefRepository _sharedPrefRepository =
      DependencyInjector.getSharedPrefReporsitory();

  List<Team> _teams = [];
  List<Team> get teams => _teams;

  Future<Team?> saveTeam(String name) async {
    Team team = Team(name: name);
    SaveState saveState = await _teamRepository.saveTeam(team);
    if (saveState == SaveState.saved) {
      setTeamToUser(team).then((value) {
        saveState = value;
      });
    }

    if (saveState == SaveState.saved) {
      return team;
    } else {
      return null;
    }
  }

  Future<void> searchTeams(String search) async {
    _teamRepository.searchTeams(search).then((value) {
      _teams = value;
      notifyListeners();
    });
  }

  Future<SaveState> removeTeamForUser() async {
    return _userRepository.removeTeamToUser().then((value) {
      if (value == SaveState.saved) {
        _sharedPrefRepository.deleteHasTeam();
      }

      return value;
    });
  }

  Future<SaveState> setTeamToUser(Team team) async {
    return _userRepository.setUserTeam(team.id).then((value) {
      if (value == SaveState.saved) {
        _sharedPrefRepository.saveHasTeam(true);
        _teams = [];
      }

      return value;
    });
  }

  Future<Team?> getUserTeam() async {
    bool userHasTeam = _sharedPrefRepository.hasTeam();

    if (userHasTeam) {
      String teamId = await _userRepository.getUserTeamId();
      return await _teamRepository.getTeamById(teamId);
    } else {
      return null;
    }
  }
}
