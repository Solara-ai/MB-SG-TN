// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_task_and_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalTaskAndPlanDto _$TotalTaskAndPlanDtoFromJson(Map<String, dynamic> json) =>
    TotalTaskAndPlanDto(
      totalTasks: json['totalTasks'] as String,
      totalPlans: json['totalPlans'] as String,
      schedule:
          SchedulesByDateDto.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TotalTaskAndPlanDtoToJson(
        TotalTaskAndPlanDto instance) =>
    <String, dynamic>{
      'totalTasks': instance.totalTasks,
      'totalPlans': instance.totalPlans,
      'schedule': instance.schedule,
    };
