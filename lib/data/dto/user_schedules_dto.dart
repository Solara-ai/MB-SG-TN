import 'package:json_annotation/json_annotation.dart';
part 'user_schedules_dto.g.dart';
@JsonSerializable()
class UserSchedulesDto {
  final String date;
  final String startTime;
  final String endTime;
  final String categoryColor;

  UserSchedulesDto ({required this.date , required this.startTime , required this.endTime , required this.categoryColor});

  factory UserSchedulesDto.fromJson(Map<String, dynamic>json) => _$UserSchedulesDtoFromJson(json);

  Map<String , dynamic> toJson () => _$UserSchedulesDtoToJson(this);
}