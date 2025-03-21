part of '../start_bloc.dart';

class PageState {
  final bool  showLoading ; 

  PageState ({this.showLoading = false});

  PageState copyWith ({bool ? showLoading}) {
      return PageState(showLoading: showLoading ?? this.showLoading );
  }

}