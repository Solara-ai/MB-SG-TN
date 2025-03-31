import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/deatail_schedule.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';

class GetScheduleByEventidUsecase extends ResultUseCase<({String eventId}) , DeatailSchedule> {
  
  final ScheduleRepository _scheduleRepository = GetIt.I<ScheduleRepository> ();

  @override
  Future<Result<DeatailSchedule>> call(({String eventId}) input) {
    return _scheduleRepository.getSchedulesByEventId(input.eventId).map(DeatailSchedule.fromDto);
  }
}