import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {

  String getProfileImageUrl() {
    final String? photoUrl = FirebaseAuth.instance.currentUser?.photoURL;
    if(photoUrl != null) {
      return photoUrl;
    } else {
      return ""; // todo replace by default photo
    }
  }

  String getProfileDisplayName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? "";
  }

  String getProfileEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? "";
  }

  Future<void> logOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future<void> saveProfileValues(String displayName) async {
    FirebaseAuth.instance.currentUser?.updateDisplayName(displayName);
  }

}