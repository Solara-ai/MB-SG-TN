part of '../auth_bloc.dart';

sealed class AuthEvent {}

class EventRefreshSession extends AuthEvent {}

class EventLogout extends AuthEvent {}
