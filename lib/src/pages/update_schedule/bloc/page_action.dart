part of '../update_schedule_bloc.dart';
sealed class PageAction {}



class ActionUpdateScheduleFaild extends PageAction {
  String message ;
  ActionUpdateScheduleFaild (this.message);
}

class ActionUpdateScheduleSuccess extends PageAction {
}

class ActionLoaddedScheduleByEventIdFaild extends PageAction {
  String message;
  ActionLoaddedScheduleByEventIdFaild({required this.message});
} 

class ActionNavigateAddCategory extends PageAction {}

class ActionLoadedListCategoryFaild extends PageAction {
  String message ;
  ActionLoadedListCategoryFaild ({required this.message});
}