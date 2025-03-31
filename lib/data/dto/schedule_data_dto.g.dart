// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDataDto _$ScheduleDataDtoFromJson(Map<String, dynamic> json) =>
    ScheduleDataDto(
      date: json['date'] as String,
      categoryColor: (json['categoryColor'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ScheduleDataDtoToJson(ScheduleDataDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'categoryColor': instance.categoryColor,
    };
