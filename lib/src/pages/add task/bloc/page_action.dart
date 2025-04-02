part of '../add_task_bloc.dart';
class PageAction {

}

class ActionAddTaskSuccess extends PageAction {
}

class ActionAddTaskFaild extends PageAction {
  final String message;
  ActionAddTaskFaild(this.message);
}