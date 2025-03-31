// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailTaskDto _$DetailTaskDtoFromJson(Map<String, dynamic> json) =>
    DetailTaskDto(
      id: json['id'] as String,
      epicId: json['epicId'] as String,
      epicName: json['epicName'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$DetailTaskDtoToJson(DetailTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'epicId': instance.epicId,
      'epicName': instance.epicName,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
    };
