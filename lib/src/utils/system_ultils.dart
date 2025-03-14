import 'dart:io';

class SystemUltils {
  SystemUltils._();

  static String? deviceId;

  static String? get deviceHeader => deviceId != null ? (Platform.isIOS ? 'IOS-' : 'ANDROID-') + deviceId! : null;
}