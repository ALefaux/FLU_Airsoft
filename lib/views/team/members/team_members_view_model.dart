import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/models/member.dart';
import 'package:airsoft/models/member_detail.dart';
import 'package:airsoft/storage/database.dart';
import 'package:airsoft/usecases/member_usecase.dart';
import 'dart:developer';

class TeamMembersViewModel {
  final MemberUsecase _memberUsecase = UsecaseInjector.getMemberUsecase();

  static const String _tag = "TeamMembersViewModel";

  Future<Map<Grade, List<Member>>> getGroupedMembers(String teamId) async {
    return _memberUsecase.getGroupedMembers(teamId);
  }

  Future<MemberDetail> getMemberDetail(String userId) async {
    log("GetMemberDetail - User id: $userId", name: _tag);
    MemberDetail memberDetail = await _memberUsecase.getMemberDetail(userId);
    log("GetMemberDetail - Has member ? ${memberDetail != null }");
    return memberDetail;
  }

}