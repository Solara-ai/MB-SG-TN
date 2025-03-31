// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_schedules_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSchedulesDto _$DetailSchedulesDtoFromJson(Map<String, dynamic> json) =>
    DetailSchedulesDto(
      scheduleId: json['scheduleId'] as String,
      eventId: json['eventId'] as String,
      eventName: json['eventName'] as String,
      description: json['description'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      date: json['date'] as String,
      endDate: json['endDate'] as String,
      remindMe: json['remindMe'] as bool,
      repeat: json['repeat'] as String,
      categories:
          CategoryDto.fromJson(json['categories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailSchedulesDtoToJson(DetailSchedulesDto instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'eventId': instance.eventId,
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
