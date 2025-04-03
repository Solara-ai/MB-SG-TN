import 'package:schedule_gen_and_time_management/data/dto/evaluate_schedule_dto.dart';
import 'package:schedule_gen_and_time_management/domain/model/event_time.dart';

class EvaluateSchedule {
   final EventTime eventTime;
  final List<String> prioriTyevents;
  final String calendarHealth;
  final double overallScore;
  final String advice;

  EvaluateSchedule(
      {required this.eventTime,
      required this.prioriTyevents,
      required this.calendarHealth,
      required this.overallScore,
      required this.advice});

  factory EvaluateSchedule.fromDto(EvaluateScheduleDto dto) => EvaluateSchedule(eventTime: EventTime.fromDto(dto.eventTime), prioriTyevents: dto.prioriTyevents, calendarHealth: dto.calendarHealth, overallScore: dto.overallScore, advice: dto.advice);
}