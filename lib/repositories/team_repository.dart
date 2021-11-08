import 'package:airsoft/models/apply.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

class TeamRepository {
  final String _tag = "TeamRepository";
  final String _applyCollectionName = "applies";
  final CollectionReference _reference = FirebaseFirestore.instance
      .collection("teams")
      .withConverter<Team>(
        fromFirestore: (snapshot, _) => Team.fromJson(json: snapshot.data()!),
        toFirestore: (team, _) => team.toJson(),
      );

  CollectionReference _getAppliesReference(String teamId) {
    return _reference
        .doc(teamId)
        .collection(_applyCollectionName)
        .withConverter<Apply>(
          fromFirestore: (snapshot, _) =>
              Apply.fromJson(json: snapshot.data()!),
          toFirestore: (team, _) => team.toJson(),
        );
  }

  Future<List<Team>> searchTeams(String search) async {
    return _reference
        .where(Team.nameSearchName, arrayContains: search)
        .get()
        .then((value) {
      return value.docs.map((e) => e.data() as Team).toList();
    }).catchError((error) {
      developer.log("ERROR: $error");
      return List<Team>.empty();
    });
  }

  Future<SaveState> saveTeam(Team team) async {
    return _reference
        .doc(team.id)
        .set(team)
        .then((value) => SaveState.saved)
        .catchError((error) => SaveState.error);
  }

  Future<Team> getTeamById(String teamId) async {
    return _reference.doc(teamId).get().then((value) {
      return value.data() as Team;
    });
  }

  Future<void> deleteTeam(String teamId) async {
    return _reference.doc(teamId).delete();
  }

  Future<SaveState> applyToTeam(String teamId, Apply apply) async {
    return _getAppliesReference(teamId)
        .doc(apply.userId)
        .set(apply)
        .then((value) => SaveState.saved)
        .onError((error, stackTrace) => SaveState.error);
  }

  Stream<Apply?> getApplyForUser(String teamId, String userId) {
    developer.log("Find apply for user $userId", name: _tag);

    return _getAppliesReference(teamId)
        .doc(userId)
        .snapshots()
        .map((event) => event.data() as Apply?);
  }

  Future<void> removeApplyForUser(String teamId, String userId) async {
    return _getAppliesReference(teamId).doc(userId).delete();
  }

  Future<void> updateTeam(Team team) async {
    return _reference.doc(team.id).set(team);
  }
}
