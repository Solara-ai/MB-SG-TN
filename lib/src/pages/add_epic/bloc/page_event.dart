part of '../add_epic_bloc.dart';

sealed class PageEvent {

}

class EventChangeEpicName extends PageEvent {
  String ? epicname ; 
  EventChangeEpicName ({this.epicname});
}

class EventChangeDescriptionEpic extends PageEvent {
  String ? descriptionEpic ;
  EventChangeDescriptionEpic ({this.descriptionEpic});
}

class EventChangeTypeNameEpic extends PageEvent {
  String ? typeNameEpic;
  EventChangeTypeNameEpic({this.typeNameEpic});
}

class EventAddEpic extends PageEvent {}

