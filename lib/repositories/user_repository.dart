import 'package:airsoft/models/save_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:airsoft/models/user.dart' as airsoft;
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final CollectionReference _reference = FirebaseFirestore.instance
      .collection('users')
      .withConverter<airsoft.User>(
        fromFirestore: (snapshot, _) =>
            airsoft.User.fromJson(json: snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  String getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid ?? "";
  }

  Future<bool> checkUserExist() async {
    return _reference.doc(getCurrentUserId()).get().then((value) {
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

  Future<airsoft.User> getCurrentUser() async {
    return _reference
        .doc(getCurrentUserId())
        .get()
        .then((value) => value.data() as airsoft.User);
  }

  Future<airsoft.User> getUserById(String userId) async {
    return _reference
        .doc(userId)
        .get()
        .then((value) => value.data() as airsoft.User);
  }
}
