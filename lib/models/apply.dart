class Apply {
  String userId;
  String userName;

  Apply({required this.userId, required this.userName});

  factory Apply.fromJson({required Map<String, dynamic> json}) {
    return Apply(
      userId: json[userIdName]! as String,
      userName: json[userNameName]! as String,
    );
  }

  Map<String, dynamic> toJson() => {
    userIdName: userId,
    userNameName: userName,
  };

  static const userIdName = "user_id";
  static const userNameName = "user_name";
}