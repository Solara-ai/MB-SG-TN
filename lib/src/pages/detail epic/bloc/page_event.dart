part of '../detail_epic_bloc.dart';

sealed class PageEvent {}


class EventLoadDetailEpic extends PageEvent {
}

class EventLoadListTask extends PageEvent {
}

class EventNavigateAddTask extends PageEvent{}

class EventNavigateEditEpic extends PageEvent {}

class EventUserSelectTaskId extends PageEvent{
  final String id ;
  EventUserSelectTaskId({required this.id});
}

class EventDeleteTask extends PageEvent {

}

