import 'package:airsoft/blocs/login/login_state.dart';
import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:airsoft/models/users/user.dart' as airsoft;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.init());

  final UserRepository userRepository = DependencyInjector.getUserRepository();

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

  Future<airsoft.User?> getUserByExternalId() async {
    final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

    if (userId.isNotEmpty) {
      return await userRepository.getByExternalId(userId);
    } else {
      return null;
    }
  }

  Future<airsoft.User?> saveSoldierName(String name) async {
    final String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    final String userImageUrl =
        FirebaseAuth.instance.currentUser?.photoURL ?? "";

    if (userId.isNotEmpty) {
      final airsoft.User user = airsoft.User(
          externalId: userId, soldierName: name, imageUrl: userImageUrl);
      return userRepository.saveUser(user);
    } else {
      return null;
    }
  }
}
