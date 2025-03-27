import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/message_user_request.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/list_message_user_ai.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';

class UserChatUsecase extends ResultUseCase<({String id_user, String message }) , ListMessageUserAi> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();
  @override
  Future<Result<ListMessageUserAi>> call(({String id_user, String message}) input) {
    final _param = MessageUserRequest(user_id: input.id_user, text: input.message);
    return _userRepository.userChatAi(_param).map(ListMessageUserAi.fromDto);
  }
}