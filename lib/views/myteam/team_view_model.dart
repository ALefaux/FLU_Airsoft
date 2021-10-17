import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:flutter/material.dart';

class TeamViewModel extends ChangeNotifier {
  final _teamRepository = DependencyInjector.getTeamRepository();
  
  Future<SaveState> saveTeam(String name) async {
    Team team = Team(name: name);
    return _teamRepository.saveTeam(team);
  }

}