import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/login/login_destination.dart';
import 'package:airsoft/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ProfilePage extends StatelessWidget {
  final _profileViewModel = DependencyInjector.getProfileViewModel();
  final _userNameController = TextEditingController();

  static const routeName = "/profile";

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userNameController.text = _profileViewModel.getProfileDisplayName();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(normalMargin),
          alignment: Alignment.center,
          child: Column(
            children: [
              Stack(
                alignment: const Alignment(1, 1),
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(_profileViewModel.getProfileImageUrl()),
                    radius: 70,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // todo show dialog to update profile photo
                        ScaffoldMessenger.of(context).showSnackBar(
                          Snackbars.error("Feature not implemented"),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: smallMargin,
              ),
              TextFormField(
                readOnly: true,
                initialValue: _profileViewModel.getProfileEmail(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adresse mail',
                ),
              ),
              const SizedBox(
                height: smallMargin,
              ),
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom d\'utilisateur',
                ),
              ),
              const SizedBox(
                height: smallMargin,
              ),
              FullSizeButton(
                onPresed: () {
                  _profileViewModel
                      .saveProfileValues(_userNameController.text)
                      .then((value) {
                    // Show message profile updated
                    ScaffoldMessenger.of(context).showSnackBar(
                      Snackbars.success("Profil mis à jour!"),
                    );
                  });
                },
                label: "Sauvegarder",
              ),
              const SizedBox(
                height: smallMargin,
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: FullSizeButton(
                    onPresed: () {
                      developer.log("Bouton disconnecte clicked");
                      _profileViewModel.logOut().then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginPage.routeName,
                          ModalRoute.withName(HomePage.routeName),
                          arguments: LoginDestination.profile,
                        );
                      });
                    },
                    label: "Déconnexion",
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
