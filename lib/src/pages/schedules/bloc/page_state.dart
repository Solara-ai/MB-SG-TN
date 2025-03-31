part of '../schedule_bloc.dart';

class PageState {
  final DateTime focusDate;
  final DateTime selectedDate;
  final CalendarFormat calendarFormat;
  final List<ScheduleByDate>? listSchedulebydate;
  final List<ScheduleData> ? listScheduleData;
  final bool  showLoading ;
  final String  eventId;

  PageState(
      {DateTime? focusDate,
      DateTime? selectedDate,
      CalendarFormat? calendarFormat,
      this.showLoading = false,
      this.eventId = '',
      this.listScheduleData,
      this.listSchedulebydate})
      : focusDate = focusDate ?? DateTime.now(),
        selectedDate = selectedDate ?? DateTime.now(),
        calendarFormat = calendarFormat ?? CalendarFormat.month;

  PageState copyWith(
      {DateTime? focusDate, DateTime? selectedDate, List<ScheduleByDate>? listSchedulebydate , CalendarFormat ? calendarFormat ,  listSchedule , bool ? showLoading , List<ScheduleData> ? listScheduleData , String ? eventId}) {
    return PageState(
        eventId: eventId ?? this.eventId,
        showLoading: showLoading ?? this.showLoading,
        calendarFormat: calendarFormat ?? this.calendarFormat,
        focusDate: focusDate ?? this.focusDate,
        selectedDate: selectedDate ?? this.selectedDate,
        listScheduleData: listScheduleData ?? this.listScheduleData,
        listSchedulebydate: listSchedulebydate ?? this.listSchedulebydate);
  }
}
