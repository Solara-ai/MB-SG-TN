import 'package:schedule_gen_and_time_management/res/R.dart';
import 'package:schedule_gen_and_time_management/src/utils/extensions/string_extension.dart';

class ValidatorUltils {
  static String? requiredFileValidator (String? value , {required String fileLabel}) {
    if (value.isNullOrEmpty()) {
      return R.strings.field_required(fileLabel);
    }
    return null;
  }

  static  String? validateEmail(String? value) {
    if (value.isNullOrEmpty()) {
      return R.strings.validateEmail;
    } else {
      if (!value!.isValidEmail) {
        return R.strings.errorFormatEmail;
      }
      return null;
    }
  }

  static String? validatePassword ( String ? value) {
       if (value.isNullOrEmpty()) {
      return R.strings.validatePassword;
    } else {
      if (value!.length < 8) {
        return R.strings.errorFormatPassword;
      }
      return null;
    }
  }

}