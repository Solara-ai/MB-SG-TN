part of '../change_password_bloc.dart';

sealed class PageAction {}

class ActionChangePasswordSuccess extends PageAction {}

class ActionChangePasswordFailed extends PageAction {}

