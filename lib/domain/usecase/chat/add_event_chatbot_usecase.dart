import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/add_event_chat_bot_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';

class AddEventChatbotUsecase extends ResultUseCase<({String message}), EmptyData?> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();

  @override
  Future<Result<EmptyData?>> call(({String message}) input) {
    final param = AddEventChatBotRequest(message: input.message);
    return _userRepository.addEventChatBot(param);
  }
  
}
