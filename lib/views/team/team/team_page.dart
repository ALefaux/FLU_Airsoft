import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/team/myteam/myteam_page.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  static const routeName = "/team";

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final _teamViewModel = DependencyInjector.getTeamViewModel();
  @override
  Widget build(BuildContext context) {
    final team = ModalRoute.of(context)!.settings.arguments as Team;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              TitleView(
                title: team.name,
              ),
              FullSizeButton(
                onPresed: () {
                  _teamViewModel.setTeamToUser(team).then((value) {
                    if (value == SaveState.saved) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        MyTeamPage.routeName,
                        ModalRoute.withName(HomePage.routeName),
                        arguments: team,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        Snackbars.error(
                          "Une erreur est survenue lors de l'enregistrement.",
                        ),
                      );
                    }
                  });
                },
                label: "S'engager",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
