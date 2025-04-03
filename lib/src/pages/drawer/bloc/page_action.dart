part of '../drawer_bloc.dart';
sealed class PageAction {

}

class ActionNavigateHomePage extends PageAction {}

class ActionNavigateTaskManagePage extends PageAction{}

class ActionNavigateSettingsPage extends PageAction{}

class ActionNavigateSchedulesPage extends PageAction{}

class ActionNavigateEditProfilePage extends PageAction{}

class ActionLogout extends PageAction {}

class ActionNavigatePerformance extends PageAction{}