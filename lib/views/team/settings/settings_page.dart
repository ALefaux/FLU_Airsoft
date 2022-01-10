import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class TeamSettingsPage extends StatefulWidget {
  const TeamSettingsPage({Key? key}) : super(key: key);

  static const String routeName = "/team/my/settings";
  static const String _tag = "TeamSettingsPage";

  @override
  _TeamSettingsPageState createState() => _TeamSettingsPageState();
}

class _TeamSettingsPageState extends State<TeamSettingsPage> {
  final TeamViewModel _teamViewModel = DependencyInjector.getTeamViewModel();
  bool acceptApplies = true;

  @override
  Widget build(BuildContext context) {
    final Team team = ModalRoute.of(context)!.settings.arguments as Team;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              TitleView(title: "${team.name} - Paramètres"),
              Row(
                children: [
                  const Expanded(
                    child: Text("Le soldat peut postuler"),
                  ),
                  Switch(
                    value: team.acceptApplies,
                    onChanged: (value) {
                      setState(() {
                        team.acceptApplies = value;
                        developer.log("Value changed: $value",
                            name: TeamSettingsPage._tag);
                        _teamViewModel.updateCanApplies(team);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
