part of '../start_bloc.dart';
sealed class PageEvent {
}

class EventNavigateLoginPage extends PageEvent {}

class EventNavigateRegisterPage extends PageEvent{}

class EventNavigateSuccess extends PageEvent {}