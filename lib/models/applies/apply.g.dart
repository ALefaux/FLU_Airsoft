// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apply _$ApplyFromJson(Map<String, dynamic> json) => Apply(
      id: json['id'] as int,
      applier: User.fromJson(json['applier'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApplyToJson(Apply instance) => <String, dynamic>{
      'id': instance.id,
      'applier': instance.applier,
      'team': instance.team,
    };
