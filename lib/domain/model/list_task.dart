import 'package:schedule_gen_and_time_management/data/dto/list_task_dto.dart';
import 'package:schedule_gen_and_time_management/domain/model/task.dart';

class ListTask {
  final String epicId;
  final String epicName;
  final String description;
  final List<Task> tasks;

  ListTask({
    required this.epicId,
    required this.epicName,
    required this.description,
    required this.tasks,
  });

  factory ListTask.fromDto(ListTaskDto dto) {
    return ListTask(
      epicId: dto.epicId,
      epicName: dto.epicName,
      description: dto.description,
      tasks: dto.tasks.map((taskDto) => Task.fromDto(taskDto)).toList(),
    );
  }
}