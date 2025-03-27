// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_schedules_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSchedulesRequest _$CreateSchedulesRequestFromJson(
        Map<String, dynamic> json) =>
    CreateSchedulesRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      repeat: json['repeat'] as String,
      repeatEndDate: json['repeatEndDate'] as String,
      remindMe: json['remindMe'] as bool,
      categoryId: json['categoryId'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$CreateSchedulesRequestToJson(
        CreateSchedulesRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'date': instance.date,
      'repeat': instance.repeat,
      'repeatEndDate': instance.repeatEndDate,
      'remindMe': instance.remindMe,
      'categoryId': instance.categoryId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
