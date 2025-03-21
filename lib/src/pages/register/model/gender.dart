import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

enum MaleUser implements DropDownFormFieldItem {
    MALE ('MALE'),
    FEMALE ('FEMALE');

    final String gender; 
    const MaleUser (this.gender);
    
    @override
    String get value => gender;

    @override 
    String get displayValue {
      switch (this) {
        case MaleUser.MALE : return  'Male';
        case MaleUser.FEMALE : return 'Female';
      }
    }
}