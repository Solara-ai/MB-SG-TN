// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_schedules_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSchedulesRequest _$UpdateSchedulesRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateSchedulesRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      repeat: json['repeat'] as String,
      repeatEndDate: json['repeatEndDate'] as String,
      remindMe: json['remindMe'] as bool,
      categoryId: json['categoryId'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      updatedType: json['updatedType'] as String,
      eventId: json['eventId'] as String,
    );

Map<String, dynamic> _$UpdateSchedulesRequestToJson(
        UpdateSchedulesRequest instance) =>
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
      'updatedType': instance.updatedType,
      'eventId': instance.eventId,
    };
