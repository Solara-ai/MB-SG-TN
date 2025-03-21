part of '../login_bloc.dart';

sealed class PageAction {}

class ActionLoginSuccessFull extends PageAction {}

// class ActionLoginFailed extends PageAction {} 

class ActionShowError extends PageAction {
  final String  error;

  ActionShowError(this.error); 
}