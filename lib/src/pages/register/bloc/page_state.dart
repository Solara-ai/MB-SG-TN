part of '../register_bloc.dart';

class PageState {
  final bool showLoading;
  final bool dontShowPassword;
  final bool dontShowConfirmPassword;

  PageState(
      {this.showLoading = false,
      this.dontShowPassword = true,
      this.dontShowConfirmPassword = true});

  PageState copyWith({bool? showloading, bool? dontShowpassword, bool? dontShowConfirmPassword}) {
    return PageState(
        showLoading: showloading ?? this.showLoading,
        dontShowPassword: dontShowpassword ?? this.dontShowPassword,
        dontShowConfirmPassword: dontShowConfirmPassword ?? this.dontShowConfirmPassword
        );
  }
  
  bool get showPassword => dontShowPassword != true;

  bool get showConfirmPassword => dontShowConfirmPassword != true;
}
