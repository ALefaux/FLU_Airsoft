import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/storage/database.dart';

class MemberDetail {
  User user;
  Grade grade;
  bool currentUserIsChief;

  MemberDetail({required this.user, required this.grade, required this.currentUserIsChief});
}