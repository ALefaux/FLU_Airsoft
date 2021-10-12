import 'package:airsoft/main.dart';
import 'package:airsoft/views/components/circle_image.dart';
import 'package:airsoft/views/login/login_page.dart';
import 'package:airsoft/views/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ProfilePage extends StatelessWidget {
  final profileViewModel = locator<ProfileViewModel>();

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            children: [
              CircleImage(profileViewModel.getProfileImageUrl()),
              ElevatedButton(
                child: const Text("Déconnexion"),
                onPressed: () {
                  developer.log("Bouton disconnecte clicked");
                  profileViewModel.logOut().then((value) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
