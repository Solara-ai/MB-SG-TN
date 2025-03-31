import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_data.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';

class GetListScheduleDataUsecase
    extends ResultUseCase<({int year, int month}), List<ScheduleData>> {
  final ScheduleRepository _scheduleRepository = GetIt.I<ScheduleRepository>();
  @override
  Future<Result<List<ScheduleData>>> call(({int month, int year}) input) {
    return _scheduleRepository
        .getListDataSchedule(input.year, input.month)
        .map((schedule) => schedule.map((ScheduleData.fromDto)).toList());
  }
}
