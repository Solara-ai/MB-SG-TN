part of '../detail_epic_bloc.dart';

sealed class PageAction {}

class ActionNavigateAddTask extends PageAction {}

class ActionNavigateEditEditEpic extends PageAction{}

class ActionLoadedListTaskFailed extends PageAction{
  String message ;
  ActionLoadedListTaskFailed({required this.message});
}

class ActionLoaddedDetailEpicFailed extends PageAction{
  String message ;
  ActionLoaddedDetailEpicFailed({required this.message});
}

class ActionDeleteTaskSuccess extends PageAction {
}