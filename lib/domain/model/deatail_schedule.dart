import 'package:schedule_gen_and_time_management/data/dto/detail_schedules_dto.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';

class DeatailSchedule {
  final String scheduleId;
  final String eventId;
  final String eventName;
  final String description;
  final String startTime;
  final String endTime;
  final String date;
  final String endDate;
  final bool remindMe;
  final String repeat;
  final Category categories;

  DeatailSchedule({required this.scheduleId , required this.eventId , required this.eventName , required this.description , required this.startTime , required this.endTime , required this.date , required this.endDate , required this.remindMe , required this.repeat , required this.categories});

  factory DeatailSchedule.fromDto (DetailSchedulesDto dto) => DeatailSchedule(scheduleId: dto.scheduleId, eventId: dto.eventId, eventName: dto.eventName, description: dto.description, startTime: dto.startTime, endTime: dto.endTime, date: dto.date, endDate: dto.endDate, remindMe: dto.remindMe, repeat: dto.repeat, categories: Category.fromDto(dto.categories));

}