import 'package:json_annotation/json_annotation.dart';
part 'schedule_data_dto.g.dart';
@JsonSerializable()
class ScheduleDataDto {
  final String date;
  final List<String> categoryColor;

  ScheduleDataDto({required this.date , required this.categoryColor});

  factory ScheduleDataDto.fromJson (Map<String , dynamic> json) => _$ScheduleDataDtoFromJson(json);
  
  Map<String , dynamic> toJson () => _$ScheduleDataDtoToJson(this);
}