import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';
import 'package:schedule_gen_and_time_management/src/pages/add_category/add_category_bloc.dart';

class TaskManageBloc extends BaseBloc<PageAction , PageEvent , PageState> {
    TaskManageBloc() : super (PageState()) {}
}