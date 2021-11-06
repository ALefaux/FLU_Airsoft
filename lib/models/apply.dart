class Apply {
  String userId;

  Apply({required this.userId});

  factory Apply.fromJson({required Map<String, dynamic> json}) {
    return Apply(
      userId: json[userIdName]! as String,
    );
  }

  Map<String, dynamic> toJson() => {
    userIdName: userId,
  };

  static const userIdName = "user_id";
}