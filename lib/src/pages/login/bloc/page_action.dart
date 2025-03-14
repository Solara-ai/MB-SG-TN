part of '../login_bloc.dart';

sealed class PageAction {}

class ActionLoginSuccessFull extends PageAction {}

class ActionLoginFailed extends PageAction {} 
