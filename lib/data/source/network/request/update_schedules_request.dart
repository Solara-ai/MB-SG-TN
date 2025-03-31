import 'package:json_annotation/json_annotation.dart';
part 'update_schedules_request.g.dart';
@JsonSerializable()
class UpdateSchedulesRequest {
  final String name;
  final String description;
  final String date;
  final String repeat;
  final String repeatEndDate;
  final bool remindMe;
  final String categoryId;
  final String startTime;
  final String endTime;
  final String updatedType;
  final String eventId;

  UpdateSchedulesRequest ({required this.name , required this.description , required this.date , required this.repeat , required this.repeatEndDate , required this.remindMe , required this.categoryId , required this.startTime , required this.endTime , required this.updatedType , required this.eventId});

  factory UpdateSchedulesRequest.fromJson(Map<String , dynamic> json) => _$UpdateSchedulesRequestFromJson(json);

  Map<String , dynamic> toJson () =>_$UpdateSchedulesRequestToJson(this);
}