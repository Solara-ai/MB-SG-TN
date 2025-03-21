
part of 'preferences.dart';
class PreferencesKey <T> {
  final String key ;
  final SharedPreferences sharedPreferences;
  final PreferencesNotifierOnChange onchange;
  PreferencesKey({required this.key , required this.sharedPreferences , required this.onchange});

  Future<bool> set (T value) async {
    if (T == Map<String , dynamic>) {
     return sharedPreferences.setString(key, jsonEncode(value as Map)).then((result){
          onchange.call(key , value);
          return result;
      });
    }
    return switch (T) {
      String  => sharedPreferences.setString(key, value as String),
      double => sharedPreferences.setDouble(key, value as double),
      int => sharedPreferences.setInt(key, value as int),
      bool => sharedPreferences.setBool(key, value as bool),
      _=> throw ArgumentError('Unsupported preferences $T type'),
    }.then((result){
      onchange.call(key , value);
      return result;
    });
  }

  T? get() {
    if (T == Map<String, dynamic>) {
      return sharedPreferences.getString(key)?.let((it) => json.decode(it) as T?);
    }
    return switch (T) {
      String => sharedPreferences.getString(key),
      int => sharedPreferences.getInt(key),
      double => sharedPreferences.getDouble(key),
      bool => sharedPreferences.getBool(key),
      _ => throw ArgumentError('Unsupported preferences $T type'),
    } as T?;
  }

  Future<bool> delete() async {
    return sharedPreferences.remove(key).then(
      (result) {
        onchange.call(key, null);
        return result;
      },
    );
  }
}
