import 'package:schedule_gen_and_time_management/data/dto/task_dto.dart';

class Task {
  final String id;
  final String title;
  final String description;    
  final String status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Task.fromDto(TaskDto dto) {
    return Task(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      status: dto.status,
    );
  }    
}