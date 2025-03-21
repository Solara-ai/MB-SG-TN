import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/login_user_request.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/auth_token.dart';
import 'package:schedule_gen_and_time_management/domain/repository/auth_repository.dart';

class LoginUsecase extends ResultUseCase<({String email , String password}) , AuthToken> {
     final AuthRepository _authRepository = GetIt.I<AuthRepository>();
    @override
  Future<Result<AuthToken>> call(({String email, String password}) input) {
     final _param = LoginUserRequest(email: input.email, password: input.password);
     return  _authRepository.loginWithEmail(_param).map(AuthToken.fromDto);
  } 
}