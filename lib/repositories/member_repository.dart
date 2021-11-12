import 'package:airsoft/models/member.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

class MemberRepository {
  final String _tag = "MemberRepository";
  final CollectionReference _reference = FirebaseFirestore.instance
      .collection(Member.tableName)
      .withConverter<Member>(
        fromFirestore: (snapshot, _) => Member.fromJson(json: snapshot.data()!),
        toFirestore: (member, _) => member.toJson(),
      );

  Future<bool> addMember(Member member) async {
    if (member.userId.isEmpty ||
        member.gradeLevel <= 0 ||
        member.teamId.isEmpty) {
      return false;
    }
    _reference.doc(member.userId).set(member);
    return true;
  }

  Future<bool> removeTeamToUser(String userId) async {
    return _reference
        .where(Member.userIdName, isEqualTo: userId)
        .get()
        .then((value) {
      if (value.docs.length == 1) {
        final String memberId = value.docs.first.id;
        _reference.doc(memberId).delete();
        return true;
      } else {
        developer.log("More than one team", name: _tag);
        return false;
      }
    }).onError((error, stackTrace) {
      developer.log("Error", name: _tag, error: error, stackTrace: stackTrace);
      return false;
    });
  }

  Future<String> getTeamId(String userId) async {
    return _reference
        .where(Member.userIdName, isEqualTo: userId)
        .get()
        .then((value) {
      return value.docs.map((e) => e.data() as Member).first.teamId;
    });
  }

  Future<Member> getMemberByUserId(String userId) async {
    return _reference
        .where(Member.userIdName, isEqualTo: userId)
        .get()
        .then((value) => value.docs.first.data() as Member);
  }

  Future<bool> isAlone(String userId) async {
    return _reference
        .where(Member.userIdName, isEqualTo: userId)
        .get()
        .then((value) => value.docs.length == 1)
        .onError((error, stackTrace) {
      developer.log("Error", name: _tag, error: error, stackTrace: stackTrace);
      return false;
    });
  }

  Future<List<Member>> getMembers(String teamId) {
    developer.log("Team ID: $teamId", name: _tag);
    return _reference
        .where(Member.teamIdName, isEqualTo: teamId)
        .get()
        .then((value) => value.docs.map((e) => e.data() as Member).toList());
  }
}
