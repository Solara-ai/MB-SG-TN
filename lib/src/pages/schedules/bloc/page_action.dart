part of '../schedule_bloc.dart';

sealed class PageAction {

}

class ActionLoaddedDataFaild extends PageAction {
  String  message;
  ActionLoaddedDataFaild ({required this.message});
}

class ActionLoaddedDataListScheduleFaild extends PageAction {
  String message;
  ActionLoaddedDataListScheduleFaild({required this.message});
}

class ActionLoadedScheduleDataError extends PageAction {
  String message ;
  ActionLoadedScheduleDataError ({required this.message});
}

class ActionDeletedEventSuccess extends PageAction {}