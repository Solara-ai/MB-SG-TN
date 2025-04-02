part of '../task_manage_tab_bloc.dart';

sealed class PageEvent {
}

class EventInitialize extends PageEvent {}

class EventLoadedListEpic extends PageEvent {
}

class EventNavigateDetailEpic extends PageEvent {
  final Epic epic;
  EventNavigateDetailEpic({required this.epic});
}

class EventUserSelectEpicId extends PageEvent {
  final String epicId;
  EventUserSelectEpicId({required this.epicId});
}

class EventDeleteEpic extends PageEvent {
  
}