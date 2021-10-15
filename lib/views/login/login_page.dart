import 'dart:developer' as developer;

import 'package:airsoft/components/snackbars.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginViewModel = DependencyInjector.getLoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignInButton(Buttons.Google, onPressed: () {
              developer.log("Google clicked");
              try {
                _loginViewModel.signInWithGoogle().then((value) {
                  _checkUserIsRegistered();
                }).catchError((error) {
                  developer.log(error);
                });
              } on Exception catch (exception) {
                developer.log("Exception catch");
              }
            }),
            SignInButton(Buttons.Facebook, onPressed: () {
              developer.log("Facebook clicked");
            }),
            SignInButton(Buttons.Apple, onPressed: () {
              developer.log("Apple clicked");
            })
          ],
        ),
      ),
    );
  }

  void _checkUserIsRegistered() {
    _loginViewModel.checkUserIsRegistered().then((value) {
      if (value) {
        _goToProfilePage();
      } else {
        developer.log("User not registered");
        _askSoldierName();
      }
    });
  }

  void _goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
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
              _loginViewModel.logOut();
            },
            child: const Text("Annuler"),
          ),
          TextButton(
              onPressed: () {
                _loginViewModel
                    .saveSoldierName(soldierNameController.text)
                    .then((value) {
                  if (value == SaveState.saved) {
                    _loginViewModel.saveSoliderNameToFirebaseUser(soldierNameController.text).then((value) {
                    _goToProfilePage();
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      Snackbars.error("Impossible d'enregistrer votre nom."),
                    );
                    _loginViewModel.logOut();
                  }
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    Snackbars.error("Impossible d'enregistrer votre nom."),
                  );
                  _loginViewModel.logOut();
                });
              },
              child: const Text("Enregistrer"))
        ],
      ),
    );
  }
}
