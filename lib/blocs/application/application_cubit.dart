import 'package:airsoft/blocs/application/application_state.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airsoft/models/users/user.dart' as airsoft;

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(const ApplicationState.init());

  final UserRepository _userRepository = DependencyInjector.getUserRepository();

  airsoft.User? _user;

  startApp() async {
    debugPrint("Start app");
    await Future.delayed(const Duration(seconds: 2));

    _userRepository.getCurrentUser().then((value) {
      _user = value;
      emit(const ApplicationState.appStarted());
    }).onError((error, stackTrace) {
      emit(const ApplicationState.error("Couldn't load user"));
    });
  }

  getUser() async {
    try {
      debugPrint("Loading user");
      emit(const ApplicationState.loading());
      if (_user != null) {
        debugPrint("Already has user");
        emit(ApplicationState.userLoaded(_user));
      } else {
        debugPrint("Load user");
        _user = await _userRepository.getCurrentUser();
        emit(ApplicationState.userLoaded(_user));
      }
    } on Exception {
      debugPrint("Error loading user");
      emit(const ApplicationState.error("Couldn't load user"));
    }
  }

  String getUserLoggedName() {
    return _user?.soldierName ?? "";
  }

  bool isUserLogged() {
    return _user != null;
  }

  void setUser(airsoft.User user) {
    _user = user;
  }

  Future<void> logOut() {
    return FirebaseAuth.instance.signOut().then((value) {
      _user = null;
    });
  }
}
