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

  Future<void> logOut() {
    return FirebaseAuth.instance.signOut();
  }

}