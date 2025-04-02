import 'package:schedule_gen_and_time_management/data/dto/epic_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/total_task_and_plan_dto.dart';
import 'package:schedule_gen_and_time_management/data/repository/base/base_network_repository.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_epic_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/repository/epic_repository.dart';

class EpicRepositoryImpl extends BaseNetworkRepository implements EpicRepository {
  final AppApi _api;

  EpicRepositoryImpl(this._api);

  @override
  Future<Result<EmptyData?>> createEpic(CreateEpicRequest param) {
    return execute(_api.createEpic(param));
  }

  @override
  Future<Result<List<EpicDto>>> getListEpic(String ? param) {
    return execute(_api.getListEpic(param));
  }

  @override
  Future<Result<EpicDto>> detailEpic(String  epicId) {
    return execute(_api.detailEpic(epicId));
  }
  @override
  Future<Result<EmptyData?>> deleteEpic(String epicId) {
    return execute(_api.deleteEpic(epicId));
  }

  @override
  Future<Result<TotalTaskAndPlanDto>> getTotalTaskAndPlan(String date) {
    return execute(_api.getTotalTaskAndPlan(date));
  }
}