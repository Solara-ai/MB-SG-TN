import 'package:schedule_gen_and_time_management/data/dto/detail_task_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_task_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/task_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_task_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';

abstract class TaskRepository {
  Future<Result<ListTaskDto>> getListTaskByEpicId(String epicId);
  Future<Result<EmptyData?>> createTask(String epicId , CreateTaskRequest param);
  Future<Result<DetailTaskDto>> detailTask (String epicId ,  String taskId);
  Future<Result<EmptyData?>> deleteTask (String epicId , String taskId);
}