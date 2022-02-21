import 'package:airsoft/models/users/user.dart';

class MemberDetail {
  User user;
  bool currentUserIsChief;

  MemberDetail({required this.user, required this.currentUserIsChief});
}
