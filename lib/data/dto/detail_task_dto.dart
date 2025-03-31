import 'package:json_annotation/json_annotation.dart';

part 'detail_task_dto.g.dart';

@JsonSerializable()
class DetailTaskDto {
  final String id;
  final String epicId;
  final String epicName;
  final String title;
  final String description;
  final String status;

  DetailTaskDto({required this.id , required this.epicId , required this.epicName , required this.title , required this.description , required this.status});

  factory DetailTaskDto.fromJson (Map<String , dynamic> json) => _$DetailTaskDtoFromJson (json);

  Map<String , dynamic> toJson () => _$DetailTaskDtoToJson(this);
}