import 'package:json_annotation/json_annotation.dart';

part 'create_team.g.dart';

@JsonSerializable()
class CreateTeam {
  String name;
  bool acceptApplies;
  int chiefId;

  CreateTeam({required this.name, required this.acceptApplies, required this.chiefId});

  factory CreateTeam.fromJson(Map<String, dynamic> json) => _$CreateTeamFromJson(json);
  Map<String, dynamic> toJson() => _$CreateTeamToJson(this);
}