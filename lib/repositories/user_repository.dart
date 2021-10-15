import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference _reference = FirebaseFirestore.instance.collection('users');

  Future<bool> checkUserExist(String userId) async {
    return _reference.doc(userId).get().then((value) {
      return value.exists;
    }).catchError((error) {
      return false;
    });
  }

  Future<SaveState> saveUser(User user) async {
    return _reference.doc(user.id).set(user.toJson()).then((value) {
      return SaveState.saved;
    }).catchError((error) {
      return SaveState.error;
    });
  }

}