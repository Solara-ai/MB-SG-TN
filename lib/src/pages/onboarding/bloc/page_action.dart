part of '../on_boarding_bloc.dart';

sealed class PageAction {}

class ActionNavigateHomePage extends PageAction {}

class ActionNavigateChatPage extends PageAction{}