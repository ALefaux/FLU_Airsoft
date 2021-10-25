import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/team/myteam_arguments.dart';
import 'package:airsoft/views/team/myteam_page.dart';
import 'package:flutter/material.dart';

class AddTeamPage extends StatefulWidget {
  const AddTeamPage({Key? key}) : super(key: key);

  static const routeName = "/team/add";

  @override
  _AddTeamPageState createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State<AddTeamPage> {
  final _nameController = TextEditingController();
  final _teamViewModel = DependencyInjector.getTeamViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              const TitleView(title: "Ajouter une team"),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nom",
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: FullSizeButton(
                      onPresed: () {
                        _teamViewModel
                            .saveTeam(_nameController.text)
                            .then((value) {
                          if (value != null) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              MyTeamPage.routeName,
                              ModalRoute.withName(HomePage.routeName),
                              arguments: MyTeamArguments(
                                team: value,
                                isUserTeam: true,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              Snackbars.success("Team sauvegardée."),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              Snackbars.error(
                                  "Une erreur est survenue lors de l'enregistrement."),
                            );
                          }
                        });
                      },
                      label: "Ajouter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
