// import 'package:schedule_gen_and_time_management/data/source/preferences/preferences.dart';

abstract class AppPreferences {
  // PreferencesNotifier listenUserProfileChange(PreferencesNotifierOnChange<UserProfileDto?> onChange);


  String? get authToken;
  String? get refreshToken;
  // UserProfileDto? get userProfile;


  Future<bool> setAuthToken(String value);
  Future<bool> setRefreshToken(String value);
  // Future<bool> setUserProfile(UserProfileDto value);


  Future<bool> removeAuthToken();
  Future<bool> removeRefreshToken();
  // Future<bool> removeUserProfile();
}
