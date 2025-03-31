import 'package:schedule_gen_and_time_management/data/dto/schedules_by_date_dto.dart';

class ScheduleByDate {
  final String scheduleId ;
  final String eventId;
  final String eventName;
  final String description;
  final String startTime;
  final String endTime;
  final String date;
  final String categoryColor;

  ScheduleByDate({required this.scheduleId , required this.eventId , required this.eventName , required this.description , required this.startTime , required this.endTime , required this.date , required this.categoryColor});

  factory ScheduleByDate.fromDto(SchedulesByDateDto dto) => ScheduleByDate(scheduleId: dto.scheduleId, eventId: dto.eventId, eventName: dto.eventName, description: dto.description, startTime: dto.startTime, endTime: dto.endTime, date: dto.date, categoryColor: dto.categoryColor);
}