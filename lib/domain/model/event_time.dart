import 'package:schedule_gen_and_time_management/data/dto/event_time_dto.dart';

class EventTime  {
  final double workStudy;
  final double entertainmentRelaxation;
  final double physicalHealth;
  final double others;

  EventTime({required this.workStudy , required this.entertainmentRelaxation , required this.physicalHealth, required this.others});

  factory EventTime.fromDto(EventTimeDto dto) => EventTime(workStudy: dto.workStudy, entertainmentRelaxation: dto.entertainmentRelaxation, physicalHealth: dto.physicalHealth, others: dto.others);
}