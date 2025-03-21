import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/notifier/data_exceptions_notifier.dart';
import 'package:schedule_gen_and_time_management/data/repository/app_preferences_impl.dart';
import 'package:schedule_gen_and_time_management/data/repository/auth_repository_impl.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_client.dart';
import 'package:schedule_gen_and_time_management/data/source/preferences/preferences.dart';
import 'package:schedule_gen_and_time_management/domain/repository/app_preferences.dart';
import 'package:schedule_gen_and_time_management/domain/repository/auth_repository.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/auth/session_usecase.dart';
import 'package:schedule_gen_and_time_management/src/utils/scope_ultils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dependency/preferences_di.dart';
part 'dependency/repository_di.dart';

Future<void> configureDependencies () async{
  await _configurePreferencesDependencies();
  await _configureRepositoryDependencies ();
}
