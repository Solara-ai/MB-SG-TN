// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_schedules_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSchedulesDto _$UserSchedulesDtoFromJson(Map<String, dynamic> json) =>
    UserSchedulesDto(
      date: json['date'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      categoryColor: json['categoryColor'] as String,
    );

Map<String, dynamic> _$UserSchedulesDtoToJson(UserSchedulesDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'categoryColor': instance.categoryColor,
    };
