import 'dart:math';

import 'package:schedule_gen_and_time_management/data/dto/evaluate_schedule_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/history_message_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_message_user_ai_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/user_profile_dto.dart';
import 'package:schedule_gen_and_time_management/data/repository/base/base_network_repository.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/add_event_chat_bot_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/message_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/send_feed_back_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_profile_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';

class UserRepositoryImpl extends BaseNetworkRepository implements UserRepository {
  final AppApi _api;
  UserRepositoryImpl (this._api);

  @override
  Future<Result<ListMessageUserAiDto>> userChatAi (MessageUserRequest messageUser) {
    return execute(_api.userChatAi(messageUser));
  }

  @override 
  Future<Result<HistoryMessageDto>> historyMessage (String user_id) {
    return execute(_api.historyMessage(user_id));
  }

  @override
  Future<Result<UserProfileDto>> getMyProfile () {
    return execute(_api.getmyProfile());
  }

  @override
  Future<Result<EmptyData?>> updateProfile(UpdateProfileRequest profileRequest) {
    return execute(_api.updateProfile(profileRequest));
  }

  @override
  Future<Result<EvaluateScheduleDto>> evaluateSchedule(String user_id) {
    return execute(_api.evaluateSchedule(user_id));
  }

  @override
  Future<Result<EmptyData?>> addEventChatBot(AddEventChatBotRequest param) {
    return execute(_api.addEventChatBot(param));
    
  }

  @override
  Future<Result<EmptyData?>> sendFeedBack(SendFeedBackRequest param) {
    return execute(_api.sendFeedBack(param));
  }
}