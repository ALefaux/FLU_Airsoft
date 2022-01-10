import 'package:airsoft/models/users/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class Team {
  int? id;
  String name;
  bool acceptApplies;

  User? chief;
  List<User> members = [];

  Team({this.id, required this.name, this.acceptApplies = true, List<String>? nameSearch});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);

}