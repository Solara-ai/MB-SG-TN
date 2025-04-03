part of '../chat_bot_bloc.dart';

sealed class PageAction {}

class ActionSendMessageSuccess extends PageAction {}

class ActionSendMessageFaild extends PageAction {
  String message ;
  ActionSendMessageFaild ({required this.message});
}

class ActionInitializeFaild extends PageAction {
  String message ; 
  ActionInitializeFaild ({required this.message});
}

class ActionAddCalendarSuccess extends PageAction{}

class ActionAddCalendarFaild extends PageAction {
  String messsage ;
  ActionAddCalendarFaild ({required this.messsage});
}