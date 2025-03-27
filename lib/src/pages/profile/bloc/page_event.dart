part of '../profile_bloc.dart';

sealed class PageEvent {}

class EventNavigateEditProfilePage extends PageEvent {}

class InitilizeEvent extends PageEvent {}