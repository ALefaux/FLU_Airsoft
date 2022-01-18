import 'dart:developer' as developer;

import 'package:airsoft/blocs/application/application_cubit.dart';
import 'package:airsoft/blocs/login/login_cubit.dart';
import 'package:airsoft/blocs/login/login_state.dart';
import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/login/login_destination.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:airsoft/views/team/team_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Scaffold(
        body: Container(
          height: double.infinity,
          color: Colors.amber,
          alignment: Alignment.center,
          child: buildLoginPage(context),
        ),
      );
    });
  }

  Widget buildLoginPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SignInButton(Buttons.Google, onPressed: () {
          developer.log("Google clicked");
          _onLoading();
          try {
            context.read<LoginCubit>().signInWithGoogle().then((value) {
              _checkUserIsRegistered();
            }).catchError((error) {
              developer.log(error);
              Navigator.of(context).pop();
            });
          } on Exception catch (_) {
            developer.log("Exception catch");
            Navigator.of(context).pop();
          }
        }),
        SignInButton(Buttons.Facebook, onPressed: () {
          developer.log("Facebook clicked");
        }),
        SignInButton(Buttons.Apple, onPressed: () {
          developer.log("Apple clicked");
        })
      ],
    );
  }

  void _goToNextView(User user) {
    final loginDestination =
        ModalRoute.of(context)!.settings.arguments as LoginDestination;

    if (loginDestination == LoginDestination.profile) {
      _goToProfilePage();
    } else if (loginDestination == LoginDestination.team) {
      TeamNavigation.navigateToTeamPage(context, user);
    }
  }

  void _checkUserIsRegistered() {
    context.read<LoginCubit>().getUserByExternalId().then((value) {
      Navigator.of(context).pop();

      if (value != null) {
        context.read<ApplicationCubit>().setUser(value);
        _goToNextView(value);
      } else {
        developer.log("User not registered");
        _askSoldierName();
      }
    });
  }

  void _goToProfilePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
      ModalRoute.withName(HomePage.routeName),
    );
  }

  void _askSoldierName() {
    final soldierNameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Saisissez votre nom soldat !"),
        content: TextFormField(
          controller: soldierNameController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<ApplicationCubit>().logOut();
            },
            child: const Text("Annuler"),
          ),
          TextButton(
              onPressed: () {
                context.read<LoginCubit>()
                    .saveSoldierName(soldierNameController.text)
                    .then((value) {
                  if (value != null) {
                    context.read<ApplicationCubit>().setUser(value);
                    _goToNextView(value);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      Snackbars.error("Impossible d'enregistrer votre nom."),
                    );
                    context.read<ApplicationCubit>().logOut();
                  }
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    Snackbars.error("Impossible d'enregistrer votre nom."),
                  );
                  context.read<ApplicationCubit>().logOut();
                });
              },
              child: const Text("Enregistrer"))
        ],
      ),
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(normalMargin),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                Text("Connexion en cours"),
              ],
            ),
          ),
        );
      },
    );
  }
}
