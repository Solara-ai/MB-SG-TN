part of '../edit_profile_bloc.dart';

class PageAction {}

class ActionLoaddedProfileFaild extends PageAction {}

class ActionUpdateProfileSuccess extends PageAction {}

class ActionUpdateProfileFaild extends PageAction {
  String error;
  ActionUpdateProfileFaild ({required this.error});
}
