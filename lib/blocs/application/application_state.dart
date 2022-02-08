import 'package:airsoft/models/users/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_state.freezed.dart';

@freezed
class ApplicationState with _$ApplicationState {
  const factory ApplicationState.init() = Initial;
  const factory ApplicationState.appStarted() = AppStarted;
  const factory ApplicationState.loading() = Loading;
  const factory ApplicationState.userLoaded(User? user) = UserLoaded;
  const factory ApplicationState.error(String message) = Error;
}