part of '../change_password_bloc.dart';

sealed class PageEvent {
}

class EventShowNewPassword extends PageEvent {}

class EventShowConfirmNewPassword extends PageEvent {}

class EventChangePassword extends PageEvent {}