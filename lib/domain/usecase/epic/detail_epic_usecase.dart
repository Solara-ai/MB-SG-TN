import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/repository/epic_repository.dart';

class DetailEpicUsecase extends ResultUseCase<({String epicId}), Epic> {
  final EpicRepository _epicRepository = GetIt.I<EpicRepository>();

  @override
  Future<Result<Epic>> call(({String epicId}) input) {
    return _epicRepository.detailEpic(input.epicId).map(Epic.fromDto);
  }
}
