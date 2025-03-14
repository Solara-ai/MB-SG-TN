part of '../login_bloc.dart';

sealed class PageEvent {}

class EventLogin extends PageEvent{}

class EventShowPassword extends PageEvent{}