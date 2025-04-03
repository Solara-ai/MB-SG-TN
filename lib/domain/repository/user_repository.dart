import 'package:schedule_gen_and_time_management/data/dto/evaluate_schedule_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/history_message_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_message_user_ai_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/user_profile_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/add_event_chat_bot_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/message_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_profile_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';

abstract class UserRepository {
   Future<Result<ListMessageUserAiDto>> userChatAi (MessageUserRequest message);
   Future<Result<HistoryMessageDto>> historyMessage (String user_id);
   Future<Result<UserProfileDto>> getMyProfile ();
   Future<Result<EmptyData?>> updateProfile(UpdateProfileRequest profileRequest);
   Future<Result<EvaluateScheduleDto>> evaluateSchedule (String user_id);
   Future<Result<EmptyData?>> addEventChatBot (AddEventChatBotRequest param);
}