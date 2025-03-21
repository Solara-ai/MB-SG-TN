import 'package:schedule_gen_and_time_management/src/utils/multiple_selected_model.dart';

class TaskModel with MultipleSelectModel {
  final String id ;
  final String name ;
  TaskModel(this.id , this.name);

  @override 
  String get selectId => id;

  @override 
  String get selectName => name ;

}