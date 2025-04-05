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
    GetIt.instance.registerFactory(() => GetlistEpicUsecase());
    GetIt.instance.registerFactory(() => GetListTaskUsecase());
    GetIt.instance.registerFactory(() => DetailEpicUsecase());
    GetIt.instance.registerFactory(() => CreateTaskUsecase());
    GetIt.instance.registerFactory(() => DetaiTaskUsecase());
    GetIt.instance.registerFactory(() => DeleteTaskUsecase());
    GetIt.instance.registerFactory(() => DeleteEpicUsecase());
    GetIt.instance.registerFactory(() => UpdateProfileUsecase());
    GetIt.instance.registerFactory(() => TotalTaskAndPlanUsecase());
    GetIt.instance.registerFactory(() => EvaluateScheduleUsecase());
    GetIt.instance.registerCachedFactory(() => AddEventChatbotUsecase());
    GetIt.instance.registerCachedFactory(() => SendFeedBackUsecase());
}