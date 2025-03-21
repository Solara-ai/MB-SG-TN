import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';

abstract class ResultUseCase<Input, Output> {
  Future<Result<Output>> call(Input input);
}
