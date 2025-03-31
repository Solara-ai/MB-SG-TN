// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpicDto _$EpicDtoFromJson(Map<String, dynamic> json) => EpicDto(
      id: json['id'] as String,
      nameEpic: json['nameEpic'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$EpicDtoToJson(EpicDto instance) => <String, dynamic>{
      'id': instance.id,
      'nameEpic': instance.nameEpic,
      'description': instance.description,
      'type': instance.type,
    };
