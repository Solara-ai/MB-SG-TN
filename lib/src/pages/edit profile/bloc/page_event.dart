part of '../edit_profile_bloc.dart';

sealed class PageEvent {

}

class EventInitilize extends PageEvent {}

class EventUserChangeFullName extends PageEvent {
  String ? fullName ;
  EventUserChangeFullName ({this.fullName});
}

class EventUserChangePhone extends PageEvent {
  String ? phone;
  EventUserChangePhone({this.phone});
}

class EventUserChangeBirthDay extends PageEvent {
  DateTime ? birthDay ; 
  EventUserChangeBirthDay({this.birthDay});
}

class EventUserChangeGender extends PageEvent {
  String ? gender;
  EventUserChangeGender ({this.gender});
}

class EventUserChangeHobbies extends PageEvent {
  String ? hobbies ;
  EventUserChangeHobbies ({this.hobbies});
}

class EventUserChangePassword extends PageEvent {
  String ? password ;
  EventUserChangePassword ({this.password});
}

class EventUserChangeoccupation extends PageEvent {
  String ? ocupation ; 
  EventUserChangeoccupation ({this.ocupation});
}

class EventUpdateProfile extends PageEvent {
  
}

class EventUserChangeEmail extends PageEvent {
  String ? email ;
  EventUserChangeEmail ({this.email});
}

class EventRequiredPaswordAgain extends PageEvent {}

class EventRequiredPassword extends PageEvent {}

