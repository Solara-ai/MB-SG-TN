part of '../on_boarding_bloc.dart';
class PageState {
  final bool showLoading;

  PageState ({this.showLoading = false});

  PageState coppyWith ({bool ? showLoading}) {
    return PageState(showLoading: showLoading ?? this.showLoading);
  }
}