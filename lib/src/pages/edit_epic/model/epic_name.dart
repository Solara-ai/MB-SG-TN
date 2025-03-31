import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

enum TypeEpic implements DropDownFormFieldItem {
  study('STUDY'),
  work('WORK');

  const TypeEpic(this.nameEpic);
  final String nameEpic;

  @override
  String get value => nameEpic;

  @override
  String get displayValue {
    switch (this) {
      case TypeEpic.work:
        return '💼 Work';
      case TypeEpic.study:
        return '📚 Study';
    }
  }
}
