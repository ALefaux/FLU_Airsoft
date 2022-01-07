import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  static const tag = "TeamPage";
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
          child: Column(children: [
            TitleView(
              title: team.name,
            ),
            FutureBuilder<Apply?>(
              future: _teamViewModel.userHasApplied(team.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AppliedTeamPage(team: team);
                } else if (snapshot.hasError) {
                  // Show error
                  developer.log("Error",
                      name: TeamPage.tag, error: snapshot.error);
                  return const Text("A eu erreur !");
                } else {
                  // Show loading
                  return NotApplyTeamPage(team: team);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class NotApplyTeamPage extends StatefulWidget {
  final Team team;

  const NotApplyTeamPage({required this.team, Key? key}) : super(key: key);

  @override
  _NotApplyTeamPageState createState() => _NotApplyTeamPageState();
}

class _NotApplyTeamPageState extends State<NotApplyTeamPage> {
  final _teamViewModel = DependencyInjector.getTeamViewModel();

  @override
  Widget build(BuildContext context) {
    final FullSizeButton button;
    if (widget.team.acceptApplies) {
      button = FullSizeButton(
        onPresed: () {
          _teamViewModel.applyToTeam(widget.team.id).then((value) {
            if (value == SaveState.saved) {
              ScaffoldMessenger.of(context).showSnackBar(
                  Snackbars.success("Vous avez postulé à ${widget.team.name}"));
              setState(() {});
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(Snackbars.error("Une erreur est survenue"));
            }
          });
        },
        label: "S'engager",
      );
    } else {
      button = FullSizeButton(
        onPresed: () {},
        label: "Interdit de s'engager",
        backgroundColor: Colors.grey,
      );
    }
    return button;
  }
}

class AppliedTeamPage extends StatefulWidget {
  final Team team;

  const AppliedTeamPage({required this.team, Key? key}) : super(key: key);

  @override
  _AppliedTeamPageState createState() => _AppliedTeamPageState();
}

class _AppliedTeamPageState extends State<AppliedTeamPage> {
  final _teamViewModel = DependencyInjector.getTeamViewModel();

  @override
  Widget build(BuildContext context) {
    return FullSizeButton(
      onPresed: () {
        _teamViewModel.removeApplyForUser(widget.team.id);
      },
      label: "Supprimer ma candidature",
    );
  }
}
