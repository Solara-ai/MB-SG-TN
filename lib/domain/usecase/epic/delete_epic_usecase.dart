import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/epic_repository.dart';

class DeleteEpicUsecase extends ResultUseCase<({String epicId}) , EmptyData?> {
  final EpicRepository _epicRepository = GetIt.I<EpicRepository>();
  @override
  Future<Result<EmptyData?>> call(({String epicId}) input) {
    return _epicRepository.deleteEpic(input.epicId);
  }
}