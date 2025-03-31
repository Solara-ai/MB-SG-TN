import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/dto/category_dto.dart';
part 'detail_schedules_dto.g.dart';
@JsonSerializable()
class DetailSchedulesDto {
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
  final CategoryDto categories;

  DetailSchedulesDto({required this.scheduleId , required this.eventId , required this.eventName , required this.description , required this.startTime , required this.endTime , required this.date , required this.endDate , required this.remindMe , required this.repeat , required this.categories});

  factory DetailSchedulesDto.fromJson (Map<String , dynamic> json) => _$DetailSchedulesDtoFromJson(json);

  Map<String , dynamic> toJson () => _$DetailSchedulesDtoToJson(this);
}