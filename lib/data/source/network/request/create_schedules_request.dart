
import 'package:json_annotation/json_annotation.dart';
part 'create_schedules_request.g.dart';
@JsonSerializable()
class CreateSchedulesRequest {
  final String name ;
  final String description;
  final String date;
  final String repeat ;
  final String repeatEndDate;
  final bool remindMe ; 
  final String categoryId;
  final String startTime ;
  final String endTime;

  CreateSchedulesRequest({required this.name , required this.description , required this.date , required this.repeat , required this.repeatEndDate , required this.remindMe , required this.categoryId , required this.startTime , required this.endTime});

  factory CreateSchedulesRequest.fromJson (Map<String , dynamic> json) => _$CreateSchedulesRequestFromJson(json);

  Map<String , dynamic> toJson() => _$CreateSchedulesRequestToJson(this); 
}