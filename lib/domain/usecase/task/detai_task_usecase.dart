import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/detail_task.dart';
import 'package:schedule_gen_and_time_management/domain/repository/task_repository.dart';

class DetaiTaskUsecase extends ResultUseCase<({String idepic, String idTask}), DetailTask> {
  TaskRepository taskRepository = GetIt.I<TaskRepository>();

  @override
  Future<Result<DetailTask>> call(({String idTask, String idepic}) input) {
    return taskRepository.detailTask(input.idepic, input.idTask).map(DetailTask.fromDto);
  }
  
}
