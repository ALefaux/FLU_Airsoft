import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/myteam/add_team_page.dart';
import 'package:flutter/material.dart';

class SearchTeam extends StatefulWidget {
  const SearchTeam({Key? key}) : super(key: key);

  @override
  _SearchTeamState createState() => _SearchTeamState();
}

class _SearchTeamState extends State<SearchTeam> {
  final TextEditingController _teamSearchController = TextEditingController();

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
                  // todo make search at text changed
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTeamPage(),
            ),
          );
        },
      ),
    );
  }
}
