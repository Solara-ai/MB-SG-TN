part of '../profile_bloc.dart';

sealed class PageAction {}

class ActionNavigateProFilePage extends PageAction {}

class ActionGetMyprofileError extends PageAction {
 final String message;
  ActionGetMyprofileError (this.message);
}