import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/schedule_by_date.dart';
import 'package:schedule_gen_and_time_management/domain/repository/schedule_repository.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

class GetListScheduleByDateUsecase extends ResultUseCase <({DateTime date}) , List<ScheduleByDate>> {
  final ScheduleRepository _scheduleRepository = GetIt.I<ScheduleRepository>();
  
  @override
  Future<Result<List<ScheduleByDate>>> call(({DateTime date}) input) {
      return _scheduleRepository.getListScheduleByDate(input.date.formatToString(DateFormatType.yyyyMMdd.pattern)).map((scheduleDto)=> scheduleDto.map(ScheduleByDate.fromDto).toList());
  }
}