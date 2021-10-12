import 'dart:developer' as developer;

import 'package:airsoft/main.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              locator<LoginViewModel>().signInWithGoogle().then((value) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
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
    );
  }
}
