import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/team/myteam_arguments.dart';
import 'package:airsoft/views/team/search_team.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:flutter/material.dart';

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({Key? key}) : super(key: key);

  static const routeName = '/team';

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  final TeamViewModel _teamViewModel = DependencyInjector.getTeamViewModel();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MyTeamArguments;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              TitleView(
                title: args.team.name,
              ),
              Visibility(
                visible: args.isUserTeam,
                child: FullSizeButton(
                  onPresed: () {
                    _teamViewModel.removeTeamForUser().then((value) {
                      if (value == SaveState.saved) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          SearchTeamPage.routeName,
                          ModalRoute.withName(HomePage.routeName),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          Snackbars.error(
                            "Une erreur est survenue.",
                          ),
                        );
                      }
                    });
                  },
                  label: "Quitter la team",
                  backgroundColor: Colors.red,
                ),
              ),
              Visibility(
                visible: !args.isUserTeam,
                child: FullSizeButton(
                  onPresed: () {
                    _teamViewModel.setTeamToUser(args.team).then((value) {
                      if (value == SaveState.saved) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MyTeamPage.routeName,
                          ModalRoute.withName(HomePage.routeName),
                          arguments: MyTeamArguments(
                            team: args.team,
                            isUserTeam: true,
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
