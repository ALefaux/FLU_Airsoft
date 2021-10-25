import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/team/myteam_arguments.dart';
import 'package:airsoft/views/team/myteam_page.dart';
import 'package:airsoft/views/team/search_team.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:flutter/material.dart';

class TeamNavigation {
  static void navigateToTeamPage(BuildContext context) {
    final TeamViewModel _teamViewModel = DependencyInjector.getTeamViewModel();

    _teamViewModel.getUserTeam().then((value) {
      if (value != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MyTeamPage.routeName,
          ModalRoute.withName(HomePage.routeName),
          arguments: MyTeamArguments(
            team: value,
            isUserTeam: true,
          ),
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
