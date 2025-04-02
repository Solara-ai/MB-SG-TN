import 'package:schedule_gen_and_time_management/data/dto/detail_task_dto.dart';

class DetailTask {
  final String id;
  final String epicId;
  final String epicName;
  final String title;
  final String description;
  final String status;

  DetailTask({
    required this.id,
    required this.epicId,
    required this.epicName,
    required this.title,
    required this.description,
    required this.status,
  });

  factory DetailTask.fromDto(DetailTaskDto dto) {
    return DetailTask(
      id: dto.id,
      epicId: dto.epicId,
      epicName: dto.epicName,
      title: dto.title,
      description: dto.description,
      status: dto.status,
    );
  }
}