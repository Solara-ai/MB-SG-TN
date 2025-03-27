import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/history_messsage.dart';
import 'package:schedule_gen_and_time_management/domain/repository/user_repository.dart';

class HistoryChatUsecase extends ResultUseCase<({String id}) , HistoryMesssage> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();
   
   @override
  Future<Result<HistoryMesssage>> call(({String id}) input) {
    return _userRepository.historyMessage(input.id).map(HistoryMesssage.fromDTO); 
  }
}