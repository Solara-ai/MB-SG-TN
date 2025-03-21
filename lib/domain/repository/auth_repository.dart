import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/login_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/register_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';

abstract class AuthRepository  {
  Future<Result<AuthTokenDto>> loginWithEmail (LoginUserRequest param);
  Future<Result<EmptyData>> registerUser (RegisterUserRequest param);
}