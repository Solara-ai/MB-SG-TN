import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/login_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/register_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/chat/history_chat_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/chat/user_chat_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/user/get_profile_usecase.dart';

part 'dependence/usecase_di.dart';
Future<void> configureDependencies() async {
  await configureUsecaseDependencies();
}