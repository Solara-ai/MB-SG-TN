import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/history_message_dto.dart';
import 'package:schedule_gen_and_time_management/data/dto/list_message_user_ai_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/login_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/message_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/register_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/api_response.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/data/dto/user_profile_dto.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST('/users/auth')
  Future<ApiResponse<AuthTokenDto>> loginWithEmail (@Body() LoginUserRequest param);

  @POST('/users/auth/register')
  Future<ApiResponse<EmptyData?>> registerUser (@Body() RegisterUserRequest param);
  
  @POST('/ai/chat')
  Future<ApiResponse<ListMessageUserAiDto>> userChatAi (@Body() MessageUserRequest param);

  @GET('/ai/chat/history/{user_id}')
  Future<ApiResponse<HistoryMessageDto>> historyMessage (@Path('user_id') String user_id);

  @GET('/user/profile') 
  Future<ApiResponse<UserProfileDto>> getmyProfile ();

}