import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/models/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

class TeamRepository {
  final CollectionReference _reference = FirebaseFirestore.instance
      .collection("teams")
      .withConverter<Team>(
        fromFirestore: (snapshot, _) => Team.fromJson(json: snapshot.data()!),
        toFirestore: (team, _) => team.toJson(),
      );

  Future<List<Team>> searchTeams(String search) async {
    return _reference
        .where(Team.NAME_SEARCH, arrayContains: search)
        .get()
        .then((value) {
      return value.docs.map((e) => e.data() as Team).toList();
    }).catchError((error) {
      developer.log("ERROR: $error");
      return List<Team>.empty();
    });
  }

  Future<SaveState> saveTeam(Team team) async {
    return _reference.doc(team.id).set(team).then((value) {
      return SaveState.saved;
    }).catchError((error) {
      return SaveState.error;
    });
  }

  Future<Team> getTeamById(String teamId) async {
    return _reference.doc(teamId).get().then((value) {
      return value.data() as Team;
    });
  }
}
