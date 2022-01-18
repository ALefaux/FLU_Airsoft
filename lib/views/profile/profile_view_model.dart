import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {

  Future<void> saveProfileValues(String displayName) async {
    FirebaseAuth.instance.currentUser?.updateDisplayName(displayName);
  }

}