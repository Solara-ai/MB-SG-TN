part of '../update_schedule_bloc.dart';
sealed class PageEvent {

}
class EventUserChangeNameEvent extends PageEvent {
  String ? name ; 
  EventUserChangeNameEvent({this.name});
}

class EventInitilize extends PageEvent {}

class EventUserChangeDescription extends PageEvent {
  String ? desCription ; 
  EventUserChangeDescription ({this.desCription});  
}

class EventUserChangeDate extends PageEvent {
  DateTime ? date; 
  EventUserChangeDate ({this.date});
}

class EventUserChangeRepeat extends PageEvent {
  String ? repeat ;
  EventUserChangeRepeat ({this.repeat});
}

class EventChangeRemindMe extends PageEvent {
  bool ? remindMe ;
  EventChangeRemindMe ({this.remindMe});
}

class EventChangeCategoryId extends PageEvent {
  String ? categoryId;
  EventChangeCategoryId ({this.categoryId});
}

class EventChangeStartTime extends PageEvent {
  TimeOfDay ? startTime ; 
  EventChangeStartTime ({this.startTime});
}

class EventChangeEndTime extends PageEvent {
  TimeOfDay ? endTime ;
  EventChangeEndTime ({this.endTime});
}

class EventChangeRepetEndDate extends PageEvent {
  DateTime ? repetEndDate ; 
  EventChangeRepetEndDate ({this.repetEndDate});
}

class EventChangeUpdateType extends PageEvent {
    String ? updateType ;
    EventChangeUpdateType ({this.updateType});
}

class EventChangeScheduleId extends PageEvent {
  String ? scheduleId ;
  EventChangeScheduleId ({this.scheduleId});
}

class EventUpdateSchedule extends PageEvent {}

class EventNavigateAddCategory extends PageEvent {}

class EventLoadListCategory extends PageEvent {}