import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/send_feed_back_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';
class SendFeedBackUsecase extends ResultUseCase<({String message}) , EmptyData?> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();
  @override
  Future<Result<EmptyData?>> call(({String message}) input) {
    final param = SendFeedBackRequest(message:  input.message);
    return _userRepository.sendFeedBack(param);
  }
}