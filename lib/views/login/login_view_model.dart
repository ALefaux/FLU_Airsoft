import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/users/user.dart' as airsoft;
import 'package:airsoft/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  LoginViewModel(this.userRepository);

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
      return userRepository.userIsRegistered();
    } else {
      return false;
    }
  }

  Future<void> logOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future<SaveState> saveSoldierName(String name) async {
    final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    final String userImageUrl =
        FirebaseAuth.instance.currentUser?.photoURL ?? "";

    if (userId.isNotEmpty) {
      final airsoft.User user =
          airsoft.User(externalId: userId, soldierName: name, imageUrl: userImageUrl);
      return userRepository.saveUser(user);
    } else {
      return SaveState.error;
    }
  }

  Future<void> saveSoliderNameToFirebaseUser(String name) async {
    return FirebaseAuth.instance.currentUser?.updateDisplayName(name);
  }
}
