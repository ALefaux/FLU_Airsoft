class Member {
  String userId;
  int gradeLevel;
  String teamId;

  static const tableName = "members";

  Member({required this.userId, required this.gradeLevel, required this.teamId});

  factory Member.fromJson({required Map<String, dynamic> json}) {
    return Member(
      userId: json[_userIdName]! as String,
      gradeLevel: json[_gradeLevelName]! as int,
      teamId: json[teamIdName]! as String
    );
  }

  Map<String, dynamic> toJson() => {
    _userIdName: userId,
    _gradeLevelName: gradeLevel,
    teamIdName: teamId
  };

  static const _userIdName = "user_id";
  static const _gradeLevelName = "grade_level";
  static const teamIdName = "team_id";
}