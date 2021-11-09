import 'package:airsoft/components/loading_view.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/viewmodels_injector.dart';
import 'package:airsoft/models/apply.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/team/team_applies/team_applies_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class TeamAppliesPage extends StatefulWidget {
  const TeamAppliesPage({Key? key}) : super(key: key);

  static const String routeName = "/team/my/applies";
  static const String _tag = "TeamAppliesPage";

  @override
  _TeamAppliesPageState createState() => _TeamAppliesPageState();
}

class _TeamAppliesPageState extends State<TeamAppliesPage> {
  final TeamAppliesViewModel _teamAppliesViewModel =
      ViewModelInjector.getTeamAppliesViewModel();

  @override
  Widget build(BuildContext context) {
    final team = ModalRoute.of(context)!.settings.arguments as Team;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              TitleView(title: "${team.name} - Invitations"),
              StreamBuilder<List<Apply>>(
                stream: _teamAppliesViewModel.getApplies(team.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //return Column(children: snapshot.data!.map((e) => createApplyCard(e)).toList(),);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return createApplyCard(team, snapshot.data![index]);
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    developer.log("An error occured",
                        name: TeamAppliesPage._tag, error: snapshot.error);
                    return const Text("Une erreur est survenue.");
                  } else {
                    return const LoadingView();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card createApplyCard(Team team, Apply apply) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(smallMargin),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                _teamAppliesViewModel.acceptApply(team.id, apply);
              },
              icon: const Icon(Icons.check),
            ),
            Flexible(
              child: Text(
                apply.userId,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {
                _teamAppliesViewModel.refuseApply(team.id, apply.userId);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
