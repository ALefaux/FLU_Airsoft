import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

class TeamRepository {
  final CollectionReference _reference = FirebaseFirestore.instance.collection("teams");

  Future<void> searchTeams(String search) async {
    _reference.where(Team.NAME, arrayContains: search).get().then((value) {
      developer.log("Teams: $value");
    }).catchError((error) {
      developer.log("ERROR: $error");
    });
  }

  Future<SaveState> saveTeam(Team team) async {
    return _reference.doc(team.id).set(team.toJson()).then((value) {
      return SaveState.saved;
    }).catchError((error) {
      return SaveState.error;
    });
  }

}