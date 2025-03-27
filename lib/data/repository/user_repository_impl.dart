import 'package:schedule_gen_and_time_management/data/dto/history_message_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_message_user_ai_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/user_profile_dto.dart';
import 'package:schedule_gen_and_time_management/data/repository/base/base_network_repository.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/message_user_request.dart';
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

}