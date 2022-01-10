import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {

  String getUserLoggedName() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.displayName != null) {
      return currentUser.displayName!;
    } else {
      return "";
    }
  }

  bool isUserLogged() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
