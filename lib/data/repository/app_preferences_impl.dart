import 'package:schedule_gen_and_time_management/data/source/preferences/preferences.dart';
import 'package:schedule_gen_and_time_management/domain/repository/app_preferences.dart';

class AppPreferencesImpl implements AppPreferences {
  
  final Preferences _preferences ;

  AppPreferencesImpl(this._preferences);

  @override 
  String ? get authToken =>  _preferences.authToken.get();

  @override 
  String ? get refreshToken => _preferences.refreshToken.get();

  @override 
  String ? get userId => _preferences.userId.get();

  @override 
  bool ? get showIntro => _preferences.showIntro.get();

  @override 
  Future<bool> setAuthToken (String value) {
    return  _preferences.authToken.set(value);
  }

  @override
  Future<bool> setRefreshToken (String value) {
    return _preferences.refreshToken.set(value);
  }

  @override
  Future<bool> setUserId (String value) {
    return _preferences.userId.set(value);
  }


  @override 
  Future<bool> setShowIntro (bool value) {
    return _preferences.showIntro.set(value);
  }


  @override
  Future<bool> removeAuthToken() => _preferences.authToken.delete();

  @override 
  Future<bool> removeRefreshToken() => _preferences.refreshToken.delete();

  @override 
  Future<bool> removeUserId () => _preferences.userId.delete();

  @override
  Future<bool> removeShowIntro () => _preferences.showIntro.delete();
}