import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';

class DeletedScheduleUsecase extends ResultUseCase<({String eventId}) , EmptyData? > {
  final ScheduleRepository _scheduleRepository = GetIt.I<ScheduleRepository>();

  @override
  Future<Result<EmptyData?>> call(({String eventId}) input) {
    return _scheduleRepository.deleteScheduleByEventId(input.eventId);
  }
}