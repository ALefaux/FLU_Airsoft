import 'package:airsoft/models/save_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:airsoft/models/user.dart' as airsoft;
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final CollectionReference _reference = FirebaseFirestore.instance.collection('users')
      .withConverter<airsoft.User>(
        fromFirestore: (snapshot, _) => airsoft.User.fromJson(json: snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  String _getUserId() {
    return FirebaseAuth.instance.currentUser?.uid ?? "";
  }

  Future<SaveState> setUserTeam(String teamId) async {
    return _reference.doc(_getUserId()).get().then((value) {
      airsoft.User user = value.data() as airsoft.User;
      user.teamId = teamId;
      
      return saveUser(user);
    });
  }

  Future<bool> checkUserExist() async {
    return _reference.doc(_getUserId()).get().then((value) {
      return value.exists;
    }).catchError((error) {
      return false;
    });
  }

  Future<SaveState> saveUser(airsoft.User user) async {
    return _reference.doc(user.id).set(user).then((value) {
      return SaveState.saved;
    }).catchError((error) {
      return SaveState.error;
    });
  }

  Future<bool> checkUserHasTeam() {
    return _reference.doc(_getUserId()).get().then((value) {
      return value.exists && (value.data() as airsoft.User).teamId != null;
    }).catchError((error) {
      return false;
    });
  }

  Future<SaveState> removeTeamToUser() async {
    return _reference.doc(_getUserId()).get().then((value) {
      airsoft.User user = value.data() as airsoft.User;
      user.teamId = null;
      
      return saveUser(user);
    });
  }

}