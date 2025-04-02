import 'package:json_annotation/json_annotation.dart';
import 'package:schedule_gen_and_time_management/data/dto/task_dto.dart';
part 'list_task_dto.g.dart';
@JsonSerializable()
class ListTaskDto {
  final String epicId;
  final String epicName;
  final String description;
  final List<TaskDto> tasks;

  ListTaskDto({
    required this.epicId,
    required this.epicName,
    required this.description,
    required this.tasks,
  });
  factory ListTaskDto.fromJson(Map<String, dynamic> json) => _$ListTaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ListTaskDtoToJson(this);
}