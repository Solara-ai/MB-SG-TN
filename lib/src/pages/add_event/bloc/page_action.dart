part of '../add_event_bloc.dart';
sealed class PageAction {
}

class ActionAddEventSuccess extends PageAction {}

class ActionAddEventFaild extends PageAction {
  String message ;
  ActionAddEventFaild (this.message);
}

class ActionLoadedFaild extends PageAction {
  String message;
  ActionLoadedFaild (this.message);
}

class ActionNavigateAddCategory extends PageAction {}