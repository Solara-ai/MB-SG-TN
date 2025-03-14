import 'package:collection/collection.dart';

class Localization {
  static const SupportedLanguage DEFAULT_LANGUAGE = SupportedLanguage.english;
  
  
}

enum SupportedLanguage {
  english (code : 'en');

  final String code;

  const SupportedLanguage ({required this.code});

  static SupportedLanguage? fromCode(String? code) {
    return SupportedLanguage.values.firstWhereOrNull((e) => e.code == code);
  }

}