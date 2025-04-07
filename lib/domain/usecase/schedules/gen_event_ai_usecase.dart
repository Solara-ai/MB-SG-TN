import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/gen_event_ai.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';

class GenEventAiUsecase extends ResultUseCase<({String message}), GenEventAi> {
  final ScheduleRepository _scheduleRepository = GetIt.I<ScheduleRepository>();
  @override
  Future<Result<GenEventAi>> call(({String message}) input) {
    return _scheduleRepository.genEventAi(input.message).map(GenEventAi.fromDto);
  }
}
