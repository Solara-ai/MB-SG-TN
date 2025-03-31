// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules_by_date_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulesByDateDto _$SchedulesByDateDtoFromJson(Map<String, dynamic> json) =>
    SchedulesByDateDto(
      scheduleId: json['scheduleId'] as String,
      eventId: json['eventId'] as String,
      eventName: json['eventName'] as String,
      description: json['description'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      date: json['date'] as String,
      categoryColor: json['categoryColor'] as String,
    );

Map<String, dynamic> _$SchedulesByDateDtoToJson(SchedulesByDateDto instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'description': instance.description,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'date': instance.date,
      'categoryColor': instance.categoryColor,
    };
