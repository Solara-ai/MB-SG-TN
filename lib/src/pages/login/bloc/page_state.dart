part of '../login_bloc.dart';

class PageState {
  final bool showLoading;
  final bool dontShowPassword;
  PageState({this.showLoading = false, this.dontShowPassword = true});

  PageState copyWith({bool? showLoading, bool? showPassword}) {
    return PageState(
        showLoading: showLoading ?? this.showLoading,
        dontShowPassword: showPassword ?? this.showLoading);
  }

  bool showPassword() {
    return dontShowPassword != true;
  }
}
