import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:flutter/material.dart';

class MyTeamPage extends StatefulWidget {
  final Team team;
  final bool isUserTeam;

  const MyTeamPage({Key? key, required this.team, this.isUserTeam = false})
      : super(key: key);

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  final TeamViewModel _teamViewModel = DependencyInjector.getTeamViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              TitleView(
                title: widget.team.name,
              ),
              Visibility(
                visible: widget.isUserTeam,
                child: FullSizeButton(
                  onPresed: () {
                    _teamViewModel.removeTeamForUser().then((value) {
                      if (value == SaveState.saved) {
                        // Return to home
                      } else {
                        // Show error
                      }
                    });
                  },
                  label: "Quitter la team",
                  backgroundColor: Colors.red,
                ),
              ),
              Visibility(
                visible: !widget.isUserTeam,
                child: FullSizeButton(
                  onPresed: () {
                    // Afficher la vue team
                    _teamViewModel.setTeamToUser(widget.team).then((value) {
                      if (value == SaveState.saved) {
                        // Update la vue team
                      } else {
                        // message d'erreur
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
