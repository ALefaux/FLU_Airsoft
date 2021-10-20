import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final SharedPrefRepository _sharedPrefRepository = DependencyInjector.getSharedPrefReporsitory();

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
    return FirebaseAuth.instance.signOut().then((value) {
      _sharedPrefRepository.deleteHasTeam();
    });
  }

  Future<void> saveProfileValues(String displayName) async {
    FirebaseAuth.instance.currentUser?.updateDisplayName(displayName);
  }

}