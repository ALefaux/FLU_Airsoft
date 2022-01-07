import 'package:airsoft/models/teams/team.dart';
import 'package:airsoft/models/users/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply.g.dart';

@JsonSerializable()
class Apply {
  int id;
  User applier; 
  Team team;

  Apply({required this.id, required this.applier, required this.team});

  factory Apply.fromJson(Map<String, dynamic> json) => _$ApplyFromJson(json);
  Map<String, dynamic> toJson() => _$ApplyToJson(this);

}