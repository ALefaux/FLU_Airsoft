import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/team/team/team_page.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:flutter/material.dart';

import '../add/add_team_page.dart';

class SearchTeamPage extends StatefulWidget {
  const SearchTeamPage({Key? key}) : super(key: key);

  static const routeName = "/team/search";

  @override
  _SearchTeamPageState createState() => _SearchTeamPageState();
}

class _SearchTeamPageState extends State<SearchTeamPage> {
  final TeamViewModel _teamViewModel = DependencyInjector.getTeamViewModel();
  final TextEditingController _teamSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _teamViewModel.addListener(updateTeams);
  }

  void updateTeams() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              const TitleView(
                title: "Rechercher une team",
              ),
              TextFormField(
                controller: _teamSearchController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Team ...',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
                onChanged: (text) {
                  _teamViewModel.searchTeams(text);
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _teamViewModel.teams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TeamPage.routeName,
                          arguments: _teamViewModel.teams[index],
                        );
                      },
                      child: Card(
                        child: SizedBox(
                          height: 50,
                          child: Container(
                            padding: const EdgeInsets.all(smallMargin),
                            child: Row(
                              children: [
                                Text(_teamViewModel.teams[index].name),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddTeamPage.routeName,
          );
        },
      ),
    );
  }
}
