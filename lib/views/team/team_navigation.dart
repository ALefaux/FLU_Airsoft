import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/team/myteam/myteam_page.dart';
import 'package:airsoft/views/team/search/search_team.dart';
import 'package:flutter/material.dart';

class TeamNavigation {
  static void navigateToTeamPage(BuildContext context, User user) {
    if (user.team != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MyTeamPage.routeName,
        ModalRoute.withName(HomePage.routeName),
        arguments: user.team,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SearchTeamPage.routeName,
        ModalRoute.withName(HomePage.routeName),
      );
    }
  }
}
