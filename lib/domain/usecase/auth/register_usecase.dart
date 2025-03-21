import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/register_user_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/auth_repository.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

class RegisterUsecase extends ResultUseCase<
    ({
      String fullName,
      String email,
      String password,
      String phone,
      String gender,
      String hobbies,
      DateTime  birthDay,
      String occupation
    }),
    EmptyData?> {
      final AuthRepository _authRepository = GetIt.I<AuthRepository>();
      @override
  Future<Result<EmptyData?>> call(({DateTime birthDay, String email, String fullName, String gender, String hobbies, String occupation, String password, String phone}) input) {
      return _authRepository.registerUser(RegisterUserRequest(fullName: input.fullName, email: input.email, phone: input .phone, gender: input.gender, hobbies: input.hobbies, occupation: input.occupation, dateOfBirthd: input.birthDay.formatToString(DateFormatType.ddMMyyyy.pattern), password: input.password));
  }
    }
