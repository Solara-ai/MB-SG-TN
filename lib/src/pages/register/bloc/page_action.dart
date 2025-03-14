part of '../register_bloc.dart';
sealed class PageAction {}

class SignUpSuccess extends PageAction {}

class SignUpFailed extends PageAction {}