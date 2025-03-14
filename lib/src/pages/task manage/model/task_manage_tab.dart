import 'package:schedule_gen_and_time_management/res/R.dart';

enum TaskManageTab {
  ALL,
  WORK,
  STUDY;

  String get tiltle {
    switch (this) {
      case TaskManageTab.ALL:
        return R.strings.all;
      case TaskManageTab.STUDY:
        return R.strings.study;
      case TaskManageTab.WORK:
        return R.strings.work;
    }
  }
}
