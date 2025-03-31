// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_epic_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEpicRequest _$CreateEpicRequestFromJson(Map<String, dynamic> json) =>
    CreateEpicRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$CreateEpicRequestToJson(CreateEpicRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
    };
