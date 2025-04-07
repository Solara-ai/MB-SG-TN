// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_event_ai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenEventAiDto _$GenEventAiDtoFromJson(Map<String, dynamic> json) =>
    GenEventAiDto(
      eventName: json['eventName'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      categories:
          CategoryDto.fromJson(json['categories'] as Map<String, dynamic>),
      remindMe: json['remindMe'] as bool,
      repeat: json['repeat'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$GenEventAiDtoToJson(GenEventAiDto instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'description': instance.description,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'date': instance.date,
      'endDate': instance.endDate,
      'remindMe': instance.remindMe,
      'repeat': instance.repeat,
      'categories': instance.categories,
    };
