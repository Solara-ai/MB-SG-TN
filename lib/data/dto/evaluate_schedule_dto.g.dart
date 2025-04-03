// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluate_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluateScheduleDto _$EvaluateScheduleDtoFromJson(Map<String, dynamic> json) =>
    EvaluateScheduleDto(
      eventTime:
          EventTimeDto.fromJson(json['eventTime'] as Map<String, dynamic>),
      prioriTyevents: (json['prioriTyevents'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      calendarHealth: json['calendarHealth'] as String,
      overallScore: (json['overallScore'] as num).toDouble(),
      advice: json['advice'] as String,
    );

Map<String, dynamic> _$EvaluateScheduleDtoToJson(
        EvaluateScheduleDto instance) =>
    <String, dynamic>{
      'eventTime': instance.eventTime,
      'prioriTyevents': instance.prioriTyevents,
      'calendarHealth': instance.calendarHealth,
      'overallScore': instance.overallScore,
      'advice': instance.advice,
    };
