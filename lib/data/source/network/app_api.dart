import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/login_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/register_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/api_response.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST('/user/auth')
  Future<ApiResponse<AuthTokenDto>> loginWithEmail (@Body() LoginUserRequest param);

  @POST('/user/auth/register')
  Future<ApiResponse<EmptyData>> registerUser (@Body() RegisterUserRequest param);


}