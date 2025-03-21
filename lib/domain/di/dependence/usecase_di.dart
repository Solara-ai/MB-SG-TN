part of '../service_locator.dart';

Future<void> configureUsecaseDependencies() async {
    GetIt.instance.registerFactory(() => LoginUsecase());
    GetIt.instance.registerFactory(() => RegisterUsecase());
}