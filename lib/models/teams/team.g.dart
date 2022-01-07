// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int?,
      name: json['name'] as String,
      acceptApplies: json['acceptApplies'] as bool? ?? true,
    )
      ..chief = json['chief'] == null
          ? null
          : User.fromJson(json['chief'] as Map<String, dynamic>)
      ..members = (json['members'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'acceptApplies': instance.acceptApplies,
      'chief': instance.chief,
      'members': instance.members,
    };
