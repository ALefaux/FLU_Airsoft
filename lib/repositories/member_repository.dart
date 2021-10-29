import 'package:airsoft/models/member.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemberRepository {
  final CollectionReference _reference = FirebaseFirestore.instance
      .collection(Member.tableName)
      .withConverter<Member>(
        fromFirestore: (snapshot, _) =>
            Member.fromJson(json: snapshot.data()!),
        toFirestore: (member, _) => member.toJson(),
      );

      Future<void> addMember(Member member) async {
        if(member.userId.isEmpty || member.gradeLevel <= 0 || member.teamId.isEmpty) {
          return Future.error("Some member fields are empty");
        }
        _reference.add(member);
      }

      Future<List<Member>> listMembers(String teamId) async {
        final snapshot = await _reference.where(Member.teamIdName, isEqualTo: teamId).get();
        return snapshot.docs.map((e) => e.data() as Member).toList();
      }
}