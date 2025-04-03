part of '../chat_bot_bloc.dart';
sealed class PageEvent {
}

class EventUserSendMessage extends PageEvent {
  String  message;

  EventUserSendMessage ({required this.message});

}

class EventInitialize extends PageEvent {}

class EventDetailMessageAIChange extends PageEvent{
  String messageAi ; 
  EventDetailMessageAIChange({this.messageAi = ''});
}

class EventAddToCalendar extends PageEvent {
}