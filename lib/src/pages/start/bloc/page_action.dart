part of '../start_bloc.dart';

sealed class PageAction {
}

class ActionNavigateLoginPage extends PageAction {}

class ActionNavigateRegisterPage extends PageAction {}