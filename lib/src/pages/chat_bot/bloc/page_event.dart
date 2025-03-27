part of '../chat_bot_bloc.dart';
sealed class PageEvent {
}

class EventUserSendMessage extends PageEvent {
  String  message;

  EventUserSendMessage ({required this.message});

}

class EventInitialize extends PageEvent {}

