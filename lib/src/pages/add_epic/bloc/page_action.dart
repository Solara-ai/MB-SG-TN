part of '../add_epic_bloc.dart';
sealed class PageAction {

}

class AddEpicSuccess extends PageAction {}

class AddEpicFaild extends PageAction{
  String message ;
  AddEpicFaild({required this.message});
}

