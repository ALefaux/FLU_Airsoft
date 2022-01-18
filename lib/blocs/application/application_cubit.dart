import 'package:airsoft/blocs/application/application_state.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airsoft/models/users/user.dart' as airsoft;

class ApplicationCubit extends Cubit<ApplicationState>  {
  ApplicationCubit() : super(const ApplicationState.init());

  final UserRepository _userRepository = DependencyInjector.getUserRepository();

  airsoft.User? _user;

  Future<void> getUser() async {
    try {
    emit(const ApplicationState.loading());
    if(_user != null) {
      emit(ApplicationState.userLoaded(_user));
    } else {
      _user = await _userRepository.getCurrentUser();
      emit(ApplicationState.userLoaded(_user));
    }
    } on Exception {
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