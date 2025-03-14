part of '../change_password_bloc.dart';

class PageState {
  final bool showLoading;
  final bool dontShowNewPassword;
  final bool dontShowConfirmNewPassword;

  PageState(
      {this.showLoading = false,
      this.dontShowNewPassword = true,
      this.dontShowConfirmNewPassword = true});

  PageState copyWith(
      {bool? showLoading, bool? dontShowNewPassword, bool? dontShowConfirmNewPassword}) {
    return PageState(
        showLoading: showLoading ?? this.showLoading,
        dontShowNewPassword: dontShowNewPassword ?? this.dontShowNewPassword,
        dontShowConfirmNewPassword: dontShowConfirmNewPassword ?? this.dontShowConfirmNewPassword);
  }

  bool get showNewPassword => dontShowNewPassword != true ;

  bool get showConfirmNewPassword => dontShowConfirmNewPassword != true ;
}