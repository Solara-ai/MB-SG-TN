import 'package:json_annotation/json_annotation.dart';
part 'task_dto.g.dart';
@JsonSerializable()
class TaskDto {
  final String id;
  final String title;
  final String description;
  final String status;

  TaskDto({required this.id , required this.title , required this.description , required this.status});

  factory TaskDto.fromJson (Map<String , dynamic> json) => _$TaskDtoFromJson(json);

  Map<String , dynamic> toJson () => _$TaskDtoToJson(this);
}