import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/epic.dart';
import 'package:schedule_gen_and_time_management/domain/repository/epic_repository.dart';

class GetlistEpicUsecase extends ResultUseCase<({String ? type}), List<Epic>> {
  final EpicRepository _epicRepository = GetIt.I<EpicRepository>();
  @override
  Future<Result<List<Epic>>> call(({String ? type}) input) {
    return _epicRepository.getListEpic(input.type).map((result) {
      return result.map(Epic.fromDto).toList();
    });
  }
}
