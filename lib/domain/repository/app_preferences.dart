abstract class AppPreferences {
  String? get appLanguage;
  bool? get showIntro;
  String? get authToken;
  String? get refreshToken;
  // UserProfileDto? get userProfile;


  Future<bool> setAppLanguage(String value);
  Future<bool> setAuthToken(String value);
  Future<bool> setRefreshToken(String value);
  // Future<bool> setUserProfile(UserProfileDto value);

  Future<bool> removeAppLanguage();
  Future<bool> removeAuthToken();
  Future<bool> removeRefreshToken();
  // Future<bool> removeUserProfile();
}