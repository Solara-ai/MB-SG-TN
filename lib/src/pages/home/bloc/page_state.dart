part of '../home_bloc.dart';

class PageState {
  final String totalTask;
  final String totalPlans;
  final ScheduleByDate? schedule;
  final bool showLoading;
  final DateTime currentDate;

  PageState({
    this.totalTask = '0',
    this.totalPlans = '0',
    this.schedule,
    this.showLoading = false,
    DateTime? currentDate,
  }) : currentDate = currentDate ?? DateTime.now();

  PageState copyWith({
    DateTime? currentDate,
    String? totalTask,
    String? totalPlans,
    ScheduleByDate? schedule,
    bool? showLoading,
  }) {
    return PageState(
      currentDate: currentDate ?? this.currentDate,
      totalTask: totalTask ?? this.totalTask,
      totalPlans: totalPlans ?? this.totalPlans,
      schedule: schedule ?? this.schedule,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
