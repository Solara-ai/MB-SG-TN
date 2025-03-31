import 'package:json_annotation/json_annotation.dart';
part 'schedules_by_date_dto.g.dart';
@JsonSerializable()
class SchedulesByDateDto {
  final String scheduleId ;
  final String eventId;
  final String eventName;
  final String description;
  final String startTime;
  final String endTime;
  final String date;
  final String categoryColor;

  SchedulesByDateDto({required this.scheduleId , required this.eventId , required this.eventName , required this.description , required this.startTime , required this.endTime , required this.date , required this.categoryColor});

  factory SchedulesByDateDto.fromJson(Map<String , dynamic> json) => _$SchedulesByDateDtoFromJson (json);

  Map<String , dynamic> toJson() => _$SchedulesByDateDtoToJson(this);
}