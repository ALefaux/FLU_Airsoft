class Member {
  String userId;
  String userName;
  String teamId;
  late int gradeLevel;

  static const tableName = "members";

  Member({required this.userId, required this.userName, required this.gradeLevel, required this.teamId});

  Member.ofSoldier({required this.userId, required this.userName, required this.teamId}) {
    gradeLevel = 1;
  }

  factory Member.fromJson({required Map<String, dynamic> json}) {
    return Member(
      userId: json[userIdName]! as String,
      userName: json[_userNameName]! as String,
      gradeLevel: json[_gradeLevelName]! as int,
      teamId: json[teamIdName]! as String
    );
  }

  Map<String, dynamic> toJson() => {
    userIdName: userId,
    _userNameName: userName,
    _gradeLevelName: gradeLevel,
    teamIdName: teamId
  };

  static const userIdName = "user_id";
  static const _userNameName = "user_name";
  static const _gradeLevelName = "grade_level";
  static const teamIdName = "team_id";
}