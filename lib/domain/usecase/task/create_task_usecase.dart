import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_task_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/task_repository.dart';

class CreateTaskUsecase extends ResultUseCase<({String epicId , String title , String description}) , EmptyData? > {
  final TaskRepository _taskRepository = GetIt.I<TaskRepository>(); 
  @override
  Future<Result<EmptyData?>> call(({String epicId , String description, String title}) input) {
    final param = CreateTaskRequest(title: input.title, description: input.title);
    return _taskRepository.createTask( input.epicId , param);
  }
}