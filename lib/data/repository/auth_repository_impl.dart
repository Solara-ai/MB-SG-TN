import 'package:schedule_gen_and_time_management/data/dto/auth_token_dto.dart';
import 'package:schedule_gen_and_time_management/data/repository/base/base_network_repository.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/login_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/register_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends BaseNetworkRepository implements AuthRepository {

  final AppApi _api;

  AuthRepositoryImpl(this._api);
  @override
    Future<Result<AuthTokenDto>> loginWithEmail (LoginUserRequest param) {
    return execute(_api.loginWithEmail(param));
  }

  @override
  Future<Result<EmptyData>> registerUser (RegisterUserRequest param) {
    return execute(_api.registerUser(param));
  }
}