part of '../drawer_bloc.dart';
sealed class PageEvent {}

class EventNavigateHomePage extends PageEvent {}

class EventNavigateTaskManagePage extends PageEvent {}

class EventNavigateSettingsPage extends PageEvent {}

class EventNavigateSchedulePage extends PageEvent{}

class EventNavigateEditProfilePage extends PageEvent{}

class EventLogout extends PageEvent {}

class EventNavigatePerfomanceEvaluation extends PageEvent{}

class EventInitilize extends PageEvent{}