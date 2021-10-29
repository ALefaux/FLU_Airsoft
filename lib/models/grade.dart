class Grade {
  String id = "";
  String name;
  int level;

  static const tableName = "grades";

  Grade({required this.name, required this.level});

  factory Grade.fromJson({required Map<String, dynamic> json}) {
    return Grade(
      name: json[_nameName]! as String,
      level: json[_levelName]! as int
    );
  }

  Map<String, dynamic> toJson() => {
    _nameName: name,
    _levelName: level
  };

  void setId(String id) {
    this.id = id;
  }

  static const _nameName = "name";
  static const _levelName = "level";
}