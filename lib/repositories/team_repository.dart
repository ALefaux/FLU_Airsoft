import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/models/teams/create_team.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:dio/dio.dart';

import 'package:airsoft/services/team_service.dart';

class TeamRepository {
  final TeamService _teamService = TeamService(Dio());

  Future<List<Team>> searchTeams(String search) async {
    return _teamService.getAll(search);
  }

  Future<Team?> saveTeam(CreateTeam createTeam) async {
    return _teamService
        .create(createTeam);
  }

  Future<Team> getTeamById(int teamId) async {
    return _teamService.getById(teamId);
  }

  Future<void> updateTeam(Team team) async {
    return _teamService.update(team);
  }

  Future<void> deleteTeam(int teamId) async {
    return _teamService.delete(teamId);
  }

  Future<List<Apply>> getApplies(int teamId) async {
    return _teamService.getApplies(teamId);
  }

  Future<void> removeUser(int teamId, int userId) async {
    return _teamService.removeUser(teamId, userId);
  }
}
