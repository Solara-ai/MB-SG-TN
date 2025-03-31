import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

enum Repeat implements DropDownFormFieldItem {
  NONE('NONE'),
  DAILY('DAILY'),
  WEEKLY('WEEKLY'),
  MONTHLY('MONTHLY'),
  YEARLY('YEARLY');

  final String nameRepet;

  const Repeat(this.nameRepet);

  @override
  String get value => nameRepet;

  @override
  String get displayValue {
    switch (this) {
      case Repeat.NONE:
        return 'None';
      case Repeat.DAILY:
        return 'Day';
      case Repeat.WEEKLY:
        return 'Week';
      case Repeat.MONTHLY:
        return 'Month';
      case Repeat.YEARLY:
        return 'Year';
    }
  }
}
