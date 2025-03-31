import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_epic_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/epic_repository.dart';

class CreateEpicUsecase extends ResultUseCase<({String name , String description , String type}) , EmptyData?> {
  final EpicRepository _epicRepository = GetIt.I<EpicRepository>();

  @override
  Future<Result<EmptyData?>> call(({String description, String name, String type}) input) {
      final param = CreateEpicRequest(name: input.name, description: input.description, type: input.type);
      return _epicRepository.createEpic(param);
  }
}