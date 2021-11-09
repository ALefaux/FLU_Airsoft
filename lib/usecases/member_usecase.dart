import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/models/member.dart';
import 'package:airsoft/repositories/grade_repository.dart';
import 'package:airsoft/repositories/member_repository.dart';
import 'package:airsoft/storage/database.dart';
import 'dart:developer' as developer;

class MemberUsecase {
  final MemberRepository _memberRepository =
      DependencyInjector.getMemberRepository();
  final GradeRepository _gradeRepository =
      DependencyInjector.getGradeRepository();

  final String _tag = "MemberUsecase";

  Future<Map<Grade, List<Member>>> getGroupedMembers(String teamId) async {
    Map<Grade, List<Member>> groupedMembers = {};
    Grade? currentGrade;
    List<Member> members = await _memberRepository.getMembers(teamId);

    developer.log("Number of members: ${members.length}", name: _tag);
    for (var element in members) {
      currentGrade = await _gradeRepository.getGradeByLevel(element.gradeLevel);

      if (groupedMembers[currentGrade] == null) {
        groupedMembers[currentGrade] = [];
      }

      groupedMembers[currentGrade]!.add(element);
    }

    developer.log("Number of member's group: ${groupedMembers.length}",
        name: _tag);
    return groupedMembers;
  }
}
