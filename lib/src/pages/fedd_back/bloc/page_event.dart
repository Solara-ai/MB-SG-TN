part of '../feed_back_bloc.dart';

sealed class PageEvent {}

class EventDetailMesage extends PageEvent {
  String? message;
  EventDetailMesage({this.message});
}

class SendFeddBack extends PageEvent {
  
}

