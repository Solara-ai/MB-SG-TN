import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/repository/app_preferences.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';

class SessionUsecase {
  final AppPreferences _appPreferences = GetIt.I<AppPreferences>();

  bool get isLoggedIn => !authToken.isNullOrEmpty();

  String? get authToken => _appPreferences.authToken;
  String? get refreshToken => _appPreferences.refreshToken;
  // UserProfile? get userProfile => _appPreferences.userProfile?.let((it) => UserProfile.fromDto(it));

  Future<void> saveToken(String authToken, String refreshToken) async {
    await [
      _appPreferences.setAuthToken(authToken),
      _appPreferences.setRefreshToken(refreshToken),
    ].wait;
  }

  // Future<bool> saveUserProfile(UserProfile userProfile) {
  //   return _appPreferences.setUserProfile(UserProfileDto.map(userProfile));
  // }

  // PreferencesNotifier listenUserProfileChange(PreferencesNotifierOnChange<UserProfile?> onChange) {
  //   return _appPreferences
  //       .listenUserProfileChange((key, data) => onChange.call(key, data?.let((it) => UserProfile.fromDto(it))));
  // }

  Future<void> clearSession() async {
    await [
      _appPreferences.removeAuthToken(),
      _appPreferences.removeRefreshToken(),
      // _appPreferences.removeUserProfile(),
    ].wait;
  }
}
