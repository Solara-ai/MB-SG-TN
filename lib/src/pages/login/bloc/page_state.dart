part of '../login_bloc.dart';

class PageState {
  final bool showLoading;
  final String email;
  final String password;
  final bool dontShowPassword;
  PageState({this.showLoading = false, this.dontShowPassword = true , this.email = '' , this.password = ''});

  PageState copyWith({bool? showLoading, bool? showPassword , String ? email , String ? password}) {
    return PageState(
        showLoading: showLoading ?? this.showLoading,
        dontShowPassword: showPassword ?? this.dontShowPassword,
        email : email ?? this.email,
        password : password ?? this.password
        );
  }

  bool showPassword() {
    return dontShowPassword != true;
  }
}
