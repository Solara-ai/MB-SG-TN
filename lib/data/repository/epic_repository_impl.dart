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
}