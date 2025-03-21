part of '../login_bloc.dart';

sealed class PageEvent {}

class EventHandleLogin extends PageEvent{}

class EventShowPassword extends PageEvent{}

class EventEmailSubmited extends PageEvent {
  final String ? email ; 
  
  EventEmailSubmited ({required this.email});
}

class EventPasswordSubmited extends PageEvent {
  final String ? password ; 
  
  EventPasswordSubmited ({required this.password});
}

