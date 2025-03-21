part of 'preferences.dart';
typedef PreferencesNotifierOnChange<T> = void Function(String key, T data);
typedef PreferencesNotifierOnDispose = void Function(PreferencesNotifier notifier);

class PreferencesNotifier<T> {
  final String _key;
  final PreferencesNotifierOnChange _onChange;
  final PreferencesNotifierOnDispose _onDispose;

  PreferencesNotifier(
      {required String key,
      required PreferencesNotifierOnChange onChange,
      required PreferencesNotifierOnDispose onDispose})
      : _key = key,
        _onDispose = onDispose,
        _onChange = onChange;

  void dispose() {
    _onDispose.call(this);
  }
}