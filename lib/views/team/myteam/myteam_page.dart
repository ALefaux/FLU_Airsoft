import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/grid_item.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/team/members/members_page.dart';
import 'package:airsoft/views/team/search/search_team.dart';
import 'package:airsoft/views/team/settings/settings_page.dart';
import 'package:airsoft/views/team/team_view_model.dart';
import 'package:flutter/material.dart';

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({Key? key}) : super(key: key);

  static const routeName = '/team/my';

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  final TeamViewModel _teamViewModel = DependencyInjector.getTeamViewModel();

  @override
  Widget build(BuildContext context) {
    final team = ModalRoute.of(context)!.settings.arguments as Team;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              TitleView(title: team.name),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    GridItem(
                      icon: const Icon(Icons.person),
                      title: "Membres",
                      onTap: () {
                        Navigator.pushNamed(context, MembersPage.routeName);
                      },
                    ),
                    GridItem(
                      icon: const Icon(Icons.mail),
                      title: "Invitations",
                      onTap: () {},
                    ),
                    GridItem(
                      icon: const Icon(Icons.settings),
                      title: "Paramètres",
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TeamSettingsPage.routeName,
                          arguments: team,
                        );
                      },
                    ),
                  ],
                ),
              ),
              FullSizeButton(
                onPresed: () async {
                  final bool userIsGeneral =
                      await _teamViewModel.userIdGeneral();

                  if (userIsGeneral) {
                    final bool isAlone = await _teamViewModel.isAlone();

                    if (isAlone) {
                      _showWillDeleteTeamDialog();
                    } else {
                      _showChoiceNewChiefDialog();
                    }
                  } else {
                    _showConfirmLeavingTeamDialog();
                  }
                },
                label: "Quitter la team",
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWillDeleteTeamDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quitter la team"),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text("Si vous quitter la team, elle sera supprimée."),
                Text("Êtes vous sûrs ?")
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                _deleteTeam();
              },
              child: const Text("Supprimer"),
            )
          ],
        );
      },
    );
  }

  void _showChoiceNewChiefDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quitter la team"),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text("Veuillez choisir un nouveau chef pour votre team.")
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            )
          ],
        );
      },
    );
  }

  void _showConfirmLeavingTeamDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quitter la team"),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text("Êtes vous sûrs de vouloir quitter la team ?")
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Non"),
            ),
            TextButton(
              onPressed: () {
                _removeTeamForUser();
              },
              child: const Text("Oui"),
            ),
          ],
        );
      },
    );
  }

  void _deleteTeam() async {
    return _teamViewModel.deleteTeam().then((value) {
      if (value == SaveState.saved) {
        _goToSearchTeam();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          Snackbars.error(
            "Une erreur est survenue.",
          ),
        );
      }
    });
  }

  void _removeTeamForUser() async {
    return _teamViewModel.removeTeamForUser().then((value) {
      if (value == SaveState.saved) {
        _goToSearchTeam();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          Snackbars.error(
            "Une erreur est survenue.",
          ),
        );
      }
    });
  }

  void _goToSearchTeam() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      SearchTeamPage.routeName,
      ModalRoute.withName(HomePage.routeName),
    );
  }
}
