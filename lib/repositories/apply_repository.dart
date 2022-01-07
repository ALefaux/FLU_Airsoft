import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/models/applies/create_apply.dart';
import 'package:airsoft/models/save_state.dart';
import 'package:airsoft/services/apply_service.dart';
import 'package:dio/dio.dart';

class ApplyRepository {
  final ApplyService _applyService = ApplyService(Dio());

  Future<Apply?> create(CreateApply createApply) {
    return _applyService.create(createApply);
  }

  Future<void> accept(int applyId) {
    return _applyService.accept(applyId);
  }

  Future<void> decline(int applyId) {
    return _applyService.decline(applyId);
  }

  Future<SaveState> removeForUser(int teamId, int userId) async {
    Apply? apply = await _applyService.findByTeamIdAndUserId(teamId, userId);

    if (apply != null) {
      return _applyService
          .delete(apply.id)
          .then((value) => SaveState.saved)
          .onError((error, stackTrace) => SaveState.error);
    } else {
      return SaveState.error;
    }
  }
}
