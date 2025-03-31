// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_epic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailEpicDto _$DetailEpicDtoFromJson(Map<String, dynamic> json) =>
    DetailEpicDto(
      id: json['id'] as String,
      nameEpic: json['nameEpic'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DetailEpicDtoToJson(DetailEpicDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEpic': instance.nameEpic,
      'description': instance.description,
      'type': instance.type,
    };
