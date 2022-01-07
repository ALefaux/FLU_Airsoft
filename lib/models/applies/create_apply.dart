import 'package:json_annotation/json_annotation.dart';

part 'create_apply.g.dart';

@JsonSerializable()
class CreateApply {
  int teamId;
  int applierId;

  CreateApply({required this.teamId, required this.applierId});

  factory CreateApply.fromJson(Map<String, dynamic> json) => _$CreateApplyFromJson(json);
  Map<String, dynamic> toJson() => _$CreateApplyToJson(this);
}