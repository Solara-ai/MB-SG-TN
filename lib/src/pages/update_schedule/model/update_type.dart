import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

enum UpdateType implements DropDownFormFieldItem {
  ALL('ALL'),
  THIS('THIS'),
  CONTINUE('CONTINUE');

  final String type ;

  const UpdateType(this.type);

  @override
  String get value => type;

  @override 
  String get displayValue {
    switch (this) {
      case UpdateType.ALL : return 'All';
      case UpdateType.CONTINUE : return 'Continue';
      case UpdateType.THIS : return 'This';
    }
  }
}