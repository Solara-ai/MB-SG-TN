part of '../task_manage_tab_bloc.dart';

sealed class PageAction {

}
class ActionNavigateDetailEpic extends PageAction{
  final Epic epic;

  ActionNavigateDetailEpic({required this.epic});
}

class ActionDeleteEpicSuccess extends PageAction {
}