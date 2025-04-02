import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/update_profile_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/date_time_extension.dart';

class UpdateProfileUsecase extends ResultUseCase<
    ({
      String fullName,
      String phone,
      DateTime birthDay,
      String gender,
      String hobbies,
      String password,
      String ocupation
    }),
    EmptyData?> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();
  @override
  Future<Result<EmptyData?>> call(
      ({
        DateTime birthDay,
        String fullName,
        String gender,
        String hobbies,
        String ocupation,
        String password,
        String phone
      }) input) {
    final param = UpdateProfileRequest(
        fullName: input.fullName,
        phone: input.phone,
        birthday: input.birthDay.formatToString(DateFormatType.yyyyMMdd.pattern),
        gender: input.gender,
        hobbies: input.hobbies,
        occupation: input.ocupation,
        password: input.password);
    return _userRepository.updateProfile(param);
  }
}
