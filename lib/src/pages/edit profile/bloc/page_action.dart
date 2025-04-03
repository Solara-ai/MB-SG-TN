part of '../edit_profile_bloc.dart';

class PageAction {}

class ActionLoaddedProfileFaild extends PageAction {
  String message;
  ActionLoaddedProfileFaild ({required this.message});
}

class ActionUpdateProfileSuccess extends PageAction {}

class ActionUpdateProfileFaild extends PageAction {
  String error;
  ActionUpdateProfileFaild ({required this.error});
}
