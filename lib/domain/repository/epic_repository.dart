import 'package:schedule_gen_and_time_management/data/dto/epic_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/total_task_and_plan_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_epic_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';

abstract class EpicRepository {
  Future<Result<EmptyData?>> createEpic (CreateEpicRequest param); 
  Future<Result<List<EpicDto>>> getListEpic (String ? param);
  Future<Result<EpicDto>> detailEpic (String epicId);
  Future<Result<EmptyData?>> deleteEpic(String epicId);
  Future<Result<TotalTaskAndPlanDto>> getTotalTaskAndPlan (String date);
}