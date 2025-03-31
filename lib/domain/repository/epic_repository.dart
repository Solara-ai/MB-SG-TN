import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_epic_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';

abstract class EpicRepository {
  Future<Result<EmptyData?>> createEpic (CreateEpicRequest param); 
}