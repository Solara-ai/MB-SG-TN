part of '../schedule_bloc.dart';

sealed class PageEvent {}

class EventInitilize extends PageEvent{}


class EventChangeSelectedDate extends PageEvent {
  DateTime ? selectedDate ;
  EventChangeSelectedDate ({this.selectedDate});
}

class EventChangeFocusDate extends PageEvent {
  DateTime ? focusDate;
  EventChangeFocusDate ({this.focusDate});
}

class EventChangeCalendarFormat extends PageEvent {
  CalendarFormat ? calendarFormat ;
  EventChangeCalendarFormat ({this.calendarFormat});
}

class EventGetListScheduleByDate extends PageEvent {}

class EventLoaddedInitilize extends PageEvent {}

class EventNavigateAddEvent extends PageEvent {}

class EventGetListScheduleData extends PageEvent{}

class EventDeleteSchedule extends PageEvent{}

class EventChangeEventId extends PageEvent {
  final String ? eventId ;
  EventChangeEventId ({this.eventId});
}

class EventNavigateChatAi extends PageEvent{}