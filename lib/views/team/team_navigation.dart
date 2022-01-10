import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/team/myteam/myteam_page.dart';
import 'package:airsoft/views/team/search/search_team.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:flutter/material.dart';

class TeamNavigation {
  static void navigateToTeamPage(BuildContext context) {
    final TeamViewModel _teamViewModel = DependencyInjector.getTeamViewModel();

    _teamViewModel.getUserTeam().then((team) {
      if (team != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MyTeamPage.routeName,
          ModalRoute.withName(HomePage.routeName),
          arguments: team,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          SearchTeamPage.routeName,
          ModalRoute.withName(HomePage.routeName),
        );
      }
    });
  }
}
