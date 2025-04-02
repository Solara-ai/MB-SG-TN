import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/list_task.dart';
import 'package:schedule_gen_and_time_management/domain/repository/task_repository.dart';

class GetListTaskUsecase extends ResultUseCase<({String epicId}), ListTask> {
  final TaskRepository _taskRepository = GetIt.I<TaskRepository>();
  @override
  Future<Result<ListTask>> call(({String epicId}) input) {
    return _taskRepository.getListTaskByEpicId(input.epicId).map((ListTask.fromDto));
  }
}
