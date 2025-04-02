part of '../add_task_bloc.dart';

sealed class PageEvent {}

class EventAddTaskSuccess extends PageEvent {
}

class EventUserChangeTitleTask extends PageEvent {
  final String ? title;
  EventUserChangeTitleTask({this.title});
}

class EventUserChangeDescriptionTask extends PageEvent {
  final String ? description;
  EventUserChangeDescriptionTask({this.description});
}

class EventAddTask extends PageEvent {}