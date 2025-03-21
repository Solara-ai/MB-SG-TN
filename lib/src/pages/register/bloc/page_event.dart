part of '../register_bloc.dart';
sealed class PageEvent {}

class EventShowPassword extends PageEvent {}

class EventShowConfirmPassword extends PageEvent{}

class EventSaveEmailUser extends PageEvent {
  final String ? email ;
  EventSaveEmailUser ({this.email});
}

class EventSaveConfirmPassword extends PageEvent {
  final String ? confirmPassword ;
  EventSaveConfirmPassword ({this.confirmPassword});
}

class EventSaveGenderUser extends PageEvent {
   final String ? gender ;
  EventSaveGenderUser ({this.gender});
}

class EventSaveFullNameUser extends PageEvent {
  final String ? fullName ;
  EventSaveFullNameUser ({this.fullName});
}

class EventSavephonelUser extends PageEvent {
   final String ? phoneNumber ;
  EventSavephonelUser ({this.phoneNumber});
}

class EventSavehobbieslUser extends PageEvent {
  final String ? hobbies ;
  EventSavehobbieslUser ({this.hobbies});
}

class EventSavebirthdaylUser extends PageEvent {
  final DateTime ? birthDay ;
  EventSavebirthdaylUser ({this.birthDay});
}

class EventSaveOccupationlUser extends PageEvent {
   final String ? occupation ;
  EventSaveOccupationlUser ({this.occupation});
}

class EventSignUp extends PageEvent {}

class EventNavigateSignUp extends PageEvent {}




