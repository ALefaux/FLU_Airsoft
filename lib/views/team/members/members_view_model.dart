import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/models/member.dart';
import 'package:airsoft/storage/database.dart';
import 'package:airsoft/usecases/member_usecase.dart';

class MembersViewModel {
  final MemberUsecase _memberUsecase = UsecaseInjector.getMemberUsecase();

  Future<Map<Grade, List<Member>>> getGroupedMembers(String teamId) async {
    return _memberUsecase.getGroupedMembers(teamId);
  }

}