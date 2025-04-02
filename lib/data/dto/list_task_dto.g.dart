// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListTaskDto _$ListTaskDtoFromJson(Map<String, dynamic> json) => ListTaskDto(
      epicId: json['epicId'] as String,
      epicName: json['epicName'] as String,
      description: json['description'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTaskDtoToJson(ListTaskDto instance) =>
    <String, dynamic>{
      'epicId': instance.epicId,
      'epicName': instance.epicName,
      'description': instance.description,
      'tasks': instance.tasks,
    };
