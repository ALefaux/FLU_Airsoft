import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'models/auth_state.dart';

class MainViewModel extends ChangeNotifier {

  AuthState authState = AuthState.notConnected;

  void listenFirebaseAuth() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        authState = AuthState.notConnected;
      } else {
        authState = AuthState.connected;
      }
    });
  }

}