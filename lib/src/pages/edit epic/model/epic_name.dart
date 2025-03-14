import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

enum EpicName implements DropDownFormFieldItem {
  study('Study'),
  work('Work');

  const EpicName(this.nameEpic);
  final String nameEpic;

  @override
  String get value => nameEpic;

  @override
  String get displayValue {
    switch (this) {
      case EpicName.work:
        return '💼 Work';
      case EpicName.study:
        return '📚 Study';
    }
  }
}
