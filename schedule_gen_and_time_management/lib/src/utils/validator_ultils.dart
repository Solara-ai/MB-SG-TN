import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';

class ValidatorUltils {
  static String? requiredFileValidator (String? value , {required String fileLabel}) {
    if (value.isNullOrEmpty()) {
      return R.strings.field_required(fileLabel);
    }
    return null;
  }
}