import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/evaluate_schedule.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';

class EvaluateScheduleUsecase extends ResultUseCase<({String userId}), EvaluateSchedule> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();
  @override
  Future<Result<EvaluateSchedule>> call(({String userId}) input) {
    return _userRepository.evaluateSchedule(input.userId).map(EvaluateSchedule.fromDto);
  }
}
