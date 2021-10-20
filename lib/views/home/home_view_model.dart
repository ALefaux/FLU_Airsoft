import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final SharedPrefRepository _sharedPrefRepository = DependencyInjector.getSharedPrefReporsitory();

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

  Future<bool> checkUserHasTeam() async {
    return _sharedPrefRepository.hasTeam();
  }
}
