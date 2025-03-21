part of '../register_bloc.dart';
sealed class PageAction {}

class SignUpSuccess extends PageAction {}

class SignUpFailed extends PageAction {
  final String  errorMessage ;

  SignUpFailed ( { required this.errorMessage});
}

class NavigateSignUpPage extends PageAction {}