import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/repositories/sharedpref_repository.dart';
import 'package:airsoft/repositories/team_repository.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepository _userRepository = DependencyInjector.getUserRepository();
  final TeamRepository _teamRepository = DependencyInjector.getTeamRepository();
  final SharedPrefRepository _sharedPrefRepository =
      DependencyInjector.getSharedPrefReporsitory();

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

  Future<Team?> getUserTeam() async {
    bool userHasTeam = _sharedPrefRepository.hasTeam();

    if (userHasTeam) {
      String teamId = await _userRepository.getUserTeamId();
      return await _teamRepository.getTeamById(teamId);
    } else {
      return null;
    }
  }
}
