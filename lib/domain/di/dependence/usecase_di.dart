part of '../service_locator.dart';

Future<void> configureUsecaseDependencies() async {
    GetIt.instance.registerFactory(() => LoginUsecase());
    GetIt.instance.registerFactory(() => RegisterUsecase());
    GetIt.instance.registerFactory(() => HistoryChatUsecase());
    GetIt.instance.registerFactory(() => UserChatUsecase());
    GetIt.instance.registerFactory(() => GetProfileUsecase());
    GetIt.instance.registerFactory(() => CreateCategoryUsecase());
    GetIt.instance.registerFactory(() => GetListCategoryUsecase());
    GetIt.instance.registerFactory(() => CreateScheduleUsecase());
    GetIt.instance.registerFactory(() => GetListScheduleByDateUsecase());
    GetIt.instance.registerFactory(() => DeletedScheduleUsecase());
    GetIt.instance.registerFactory(() =>UpdateScheduleUscase());
    GetIt.instance.registerFactory(() => GetListScheduleDataUsecase());
    GetIt.instance.registerFactory(() => GetScheduleByEventidUsecase());
    GetIt.instance.registerFactory(() => CreateEpicUsecase());
}