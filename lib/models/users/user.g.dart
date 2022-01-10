// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      externalId: json['externalId'] as String,
      soldierName: json['soldierName'] as String,
      imageUrl: json['imageUrl'] as String,
    )
      ..applies = (json['applies'] as List<dynamic>?)
          ?.map((e) => Apply.fromJson(e as Map<String, dynamic>))
          .toList()
      ..team = json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'soldierName': instance.soldierName,
      'imageUrl': instance.imageUrl,
      'applies': instance.applies,
      'team': instance.team,
    };
