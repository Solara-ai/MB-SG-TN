part of '../detail_task_bloc.dart';
class PageAction {}

class ActionNavigateEditTask extends PageAction {
}

class ActionLoaddedDataFaild extends PageAction {
  String messsage;
  ActionLoaddedDataFaild({required this.messsage});
}