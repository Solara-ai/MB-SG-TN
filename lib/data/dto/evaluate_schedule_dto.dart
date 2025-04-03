import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/dto/event_time_dto.dart';

part 'evaluate_schedule_dto.g.dart';

@JsonSerializable()
class EvaluateScheduleDto {
  final EventTimeDto eventTime;
  final List<String> prioriTyevents;
  final String calendarHealth;
  final double overallScore;
  final String advice;

  EvaluateScheduleDto(
      {required this.eventTime,
      required this.prioriTyevents,
      required this.calendarHealth,
      required this.overallScore,
      required this.advice});

  factory EvaluateScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$EvaluateScheduleDtoFromJson(json);

  Map<String , dynamic> toJson () => _$EvaluateScheduleDtoToJson(this);
  
   
}
