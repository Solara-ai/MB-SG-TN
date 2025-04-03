// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_time_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventTimeDto _$EventTimeDtoFromJson(Map<String, dynamic> json) => EventTimeDto(
      workStudy: (json['workStudy'] as num).toDouble(),
      entertainmentRelaxation:
          (json['entertainmentRelaxation'] as num).toDouble(),
      physicalHealth: (json['physicalHealth'] as num).toDouble(),
      others: (json['others'] as num).toDouble(),
    );

Map<String, dynamic> _$EventTimeDtoToJson(EventTimeDto instance) =>
    <String, dynamic>{
      'workStudy': instance.workStudy,
      'entertainmentRelaxation': instance.entertainmentRelaxation,
      'physicalHealth': instance.physicalHealth,
      'others': instance.others,
    };
