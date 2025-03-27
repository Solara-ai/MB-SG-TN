import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/user_profile.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';

class GetProfileUsecase extends ResultUseCase< () , UserProfile > {
    final UserRepository _userRepository = GetIt.I<UserRepository>(); 
    @override
  Future<Result<UserProfile>> call(() input) {
      return _userRepository.getMyProfile().map(UserProfile.fromDto);
  }
}