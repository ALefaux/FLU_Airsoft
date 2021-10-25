import 'package:airsoft/models/team.dart';

class MyTeamArguments {
  final Team team;
  final bool isUserTeam;
  
  MyTeamArguments({required this.team, this.isUserTeam = false});
}