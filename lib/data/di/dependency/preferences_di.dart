part of '../service_locator.dart';

    // đây là nơi khai báo SharedPreference . 
Future<void> _configurePreferencesDependencies() async {
  // App Preferences
  (await SharedPreferences.getInstance()).let((sharedPreferences) {
    final preferences = Preferences(sharedPreferences);
    GetIt.instance.registerSingleton<AppPreferences>(AppPreferencesImpl(preferences));
  });

  // Session Usecase: AppClient depends on this, so we have to register here
  GetIt.instance.registerFactory(() => SessionUsecase());
}
