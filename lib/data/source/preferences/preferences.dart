
import 'package:schedule_gen_and_time_management/src/utils/scope_ultils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
part 'preferences_key.dart';
part 'preferences_notifier.dart';


class Preferences {
  final SharedPreferences _sharedPreferences;
  Preferences (this._sharedPreferences);
   final List<PreferencesNotifier> _notifierItems = [];
  
   late PreferencesKey<String> authToken = _createKey ('AUTH_TOKEN');
   late PreferencesKey<String> refreshToken = _createKey ('REFRESH_TOKEN');
   late PreferencesKey<String> userId = _createKey('USER_ID');
   late PreferencesKey<Map<String , dynamic>> userProfile = _createKey ('USER_PROFILE');
   late PreferencesKey <bool> showIntro = _createKey ('SHOW_INTRO');
   PreferencesKey<T> _createKey<T> (String key) {
      return PreferencesKey<T>(key: key, sharedPreferences:_sharedPreferences, onchange:  (key, value) {
        _notifierItems.where((element) => element._key == key).forEach((element) => element._onChange.call(key, value));
      },);
   }  

    PreferencesNotifier listen<T>(String key, PreferencesNotifierOnChange onChange) {
    return PreferencesNotifier<T>(
        key: key,
        onChange: onChange,
        onDispose: (notifier) {
          _notifierItems.remove(notifier);
        }).also((notifier) {
      _notifierItems.add(notifier);
    });
  }

  

}