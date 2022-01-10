import 'package:airsoft/models/applies/apply.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String externalId;
  String soldierName;
  String imageUrl;

  List<Apply>? applies;
  Team? team;

  User({this.id, required this.externalId, required this.soldierName, required this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}
