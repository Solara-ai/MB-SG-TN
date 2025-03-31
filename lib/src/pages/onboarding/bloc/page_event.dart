part of '../on_boarding_bloc.dart';

sealed class PageEvent {}

class EventSkipOnboarding extends PageEvent {}

class EventGotoScerrenChat extends PageEvent{}