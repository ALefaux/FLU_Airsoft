// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTeam _$CreateTeamFromJson(Map<String, dynamic> json) => CreateTeam(
      name: json['name'] as String,
      acceptApplies: json['acceptApplies'] as bool,
      chiefId: json['chiefId'] as int,
    );

Map<String, dynamic> _$CreateTeamToJson(CreateTeam instance) =>
    <String, dynamic>{
      'name': instance.name,
      'acceptApplies': instance.acceptApplies,
      'chiefId': instance.chiefId,
    };
