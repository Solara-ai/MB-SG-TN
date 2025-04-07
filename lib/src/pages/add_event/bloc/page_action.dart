part of '../add_event_bloc.dart';
sealed class PageAction {
}

class ActionAddEventSuccess extends PageAction {}

class ActionAddEventFaild extends PageAction {

}

class ActionLoadedFaild extends PageAction {
  String message;
  ActionLoadedFaild (this.message);
}

class ActionNavigateAddCategory extends PageAction {}

class ActionGenEventAiSuccess extends PageAction{}