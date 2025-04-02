part of '../service_locator.dart';

Future<void> _configureRepositoryDependencies() async {
   GetIt.instance.registerSingleton(DataExceptionNotifier());
  final _alice = AppClient.createAliceLogger?.also((alice) {
    GetIt.instance.registerSingleton(alice);
  });
  // Network
  final _appApi = AppApi(AppClient.createAppClient(_alice));
  // Repository
  // GetIt.instance.registerSingleton<AssetRepository>(AssetRepositoryImpl());
  // GetIt.instance.registerSingleton<UserRepository>(UserRepositoryImpl(_appApi));
  GetIt.instance.registerSingleton<AuthRepository>(AuthRepositoryImpl(_appApi));
  GetIt.instance.registerSingleton<UserRepository>(UserRepositoryImpl(_appApi));
  GetIt.instance.registerSingleton<CategoryRepository> (CategoryRepositoryImpl(_appApi));
  GetIt.instance.registerSingleton<ScheduleRepository>(SchedulesRepositoryImpl(_appApi));
  GetIt.instance.registerSingleton<EpicRepository>(EpicRepositoryImpl(_appApi));
  GetIt.instance.registerSingleton<TaskRepository>(TaskRepositoryImpl(_appApi));
}
