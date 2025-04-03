part of '../performance_evaluation_bloc.dart';

class PageState {
  final bool  showLoading;
  final EvaluateSchedule ? evaluateSchedule;

  PageState({this.showLoading = false , this.evaluateSchedule});

  PageState copyWith ({bool ? showLoading , EvaluateSchedule ? evaluateSchedule}) {
    return PageState(
      showLoading: showLoading ?? this.showLoading,
      evaluateSchedule: evaluateSchedule ?? this.evaluateSchedule
    );
  }
}