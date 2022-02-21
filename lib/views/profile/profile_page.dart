import 'package:airsoft/blocs/application/application_cubit.dart';
import 'package:airsoft/blocs/application/application_state.dart';
import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/error/error.dart';
import 'package:airsoft/views/loading/loading.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profile";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileViewModel = DependencyInjector.getProfileViewModel();

  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<ApplicationCubit>()..getUser(),
      child: BlocBuilder<ApplicationCubit, ApplicationState>(builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(normalMargin),
              alignment: Alignment.center,
              child: state.maybeWhen(
                userLoaded: (User? user) => _buildProfilePage(context, user),
                loading: () {
                  return AirsoftLoadingWidget.build();
                },
                orElse: () {
                  return AirsoftErrorWidget.build();
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProfilePage(BuildContext context, User? user) {
    _userNameController.text = user?.soldierName ?? "";

    return Column(
      children: [
        Stack(
          alignment: const Alignment(1, 1),
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user?.imageUrl ?? ""),
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
          initialValue: "",
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
            _profileViewModel.saveProfileValues(_userNameController.text).then((value) {
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
                context.read<ApplicationCubit>().logOut().then((value) {
                  Navigator.pop(context);
                });
              },
              label: "Déconnexion",
              backgroundColor: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
