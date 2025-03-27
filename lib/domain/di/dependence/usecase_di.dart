part of '../service_locator.dart';

Future<void> configureUsecaseDependencies() async {
    GetIt.instance.registerFactory(() => LoginUsecase());
    GetIt.instance.registerFactory(() => RegisterUsecase());
    GetIt.instance.registerFactory(() => HistoryChatUsecase());
    GetIt.instance.registerFactory(() => UserChatUsecase());
    GetIt.instance.registerCachedFactory(() => GetProfileUsecase());
}