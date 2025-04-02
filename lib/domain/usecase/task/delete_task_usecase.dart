import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/task_repository.dart';

class DeleteTaskUsecase extends ResultUseCase <({String epicId , String taskId}) , EmptyData?> {
  final TaskRepository _taskRepository = GetIt.I<TaskRepository>();

  @override
  Future<Result<EmptyData?>> call(({String epicId, String taskId}) input) {
    return _taskRepository.deleteTask(input.epicId, input.taskId);
  }
}