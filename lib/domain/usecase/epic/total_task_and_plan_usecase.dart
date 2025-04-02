import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/total_task_and_plan.dart';
import 'package:schedule_gen_and_time_management/domain/repository/epic_repository.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

class TotalTaskAndPlanUsecase extends ResultUseCase<({DateTime date}), TotalTaskAndPlan> {
  final EpicRepository _epicRepository = GetIt.I<EpicRepository>();

  @override
  Future<Result<TotalTaskAndPlan>> call(({DateTime date}) input) {
    return _epicRepository
        .getTotalTaskAndPlan(input.date.formatToString(DateFormatType.yyyyMMdd.pattern))
        .map(TotalTaskAndPlan.fromDto);
  }
}
