import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/user.dart' as airsoft;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends ChangeNotifier {
  final _userRepository = DependencyInjector.getUserRepository();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return Future.error("No google user");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> checkUserIsRegistered() async {
    final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

    if (userId.isNotEmpty) {
      return _userRepository.checkUserExist(userId);
    } else {
      return false;
    }
  }

  Future<void> logOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future<SaveState> saveSoldierName(String name) async {
    final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

    if (userId.isNotEmpty) {
      final airsoft.User user = airsoft.User(id: userId, soldierName: name);
      return _userRepository.saveUser(user);
    } else {
      return SaveState.error;
    }
  }
  
  Future<void> saveSoliderNameToFirebaseUser(String name) async {
    return FirebaseAuth.instance.currentUser?.updateDisplayName(name);
  }
}
