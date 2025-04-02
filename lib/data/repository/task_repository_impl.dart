import 'package:schedule_gen_and_time_management/data/dto/detail_task_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_task_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/task_dto.dart';
import 'package:schedule_gen_and_time_management/data/repository/base/base_network_repository.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_task_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends BaseNetworkRepository implements TaskRepository {
  final AppApi _appApi;
  
  TaskRepositoryImpl(this._appApi);

  @override
  Future<Result<ListTaskDto>> getListTaskByEpicId(String epicId)  {
    return execute(_appApi.getListTaskByEpicId(epicId));
  }

  @override
  Future<Result<EmptyData?>> createTask(String epicId, CreateTaskRequest param) {
    return execute(_appApi.createTask(epicId, param));
  }

  @override 
  Future<Result<DetailTaskDto>> detailTask(String epicId , String taskId) {
    return execute(_appApi.detailTask(epicId, taskId));
  }

  @override
  Future<Result<EmptyData?>> deleteTask(String epicId, String taskId) {
    return execute(_appApi.deleteTask(epicId, taskId));
  }
}