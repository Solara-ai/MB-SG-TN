 import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class AllEpic implements DropDownFormFieldItem {
  final String id;
  final String name ;
  final String desCription;
  
  AllEpic ({required this.name , required this.desCription , required this.id});

  @override
  String get value => id;

  @override 
  String get displayValue => name ;
}