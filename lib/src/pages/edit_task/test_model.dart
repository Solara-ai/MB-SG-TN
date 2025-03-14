import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class TestModel extends DropDownFormFieldItem {
  TestModel({required super.value, required super.displayValue});
}

List<TestModel> nameOfEpic = [
  TestModel(value: '1', displayValue: 'epic name 1'),
  TestModel(value: '2', displayValue: 'epic name 2'),
  TestModel(value: '3', displayValue: 'epic name 1'),
  TestModel(value: '4', displayValue: 'epic name 1'),
  TestModel(value: '5', displayValue: 'epic name 1')
];
