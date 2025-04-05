part of '../feed_back_bloc.dart';
class PageState {
  String message;
  bool showLoading;

  PageState({
    this.showLoading = false,
    this.message = "",
  });
  PageState copyWith({
    String? message,
    bool? showLoading,
  }) {
    return PageState(
      message: message ?? this.message,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
